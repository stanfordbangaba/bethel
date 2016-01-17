package zw.co.bangsoft.bethel.model

import org.springframework.dao.DataIntegrityViolationException

class ReceiptController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [receiptInstanceList: Receipt.list(params), receiptInstanceTotal: Receipt.count()]
    }

    def create() {
        [receiptInstance: new Receipt(params)]
    }

    def save() {
        def receiptInstance = new Receipt(params)
		
		if ("PROJECT CASH".equals(receiptInstance.type) || "PLEDGE PAYMENT".equals(receiptInstance.type)) {
			println "&&&&&  ${receiptInstance.projectId}"
			if (!receiptInstance.projectId) {
				println "*****  ${receiptInstance.projectId}"
				flash.message = "Error: Please select the project"
				render(view: "create", model: [receiptInstance: receiptInstance])
				return
			} else {
				if ("CLOSED".equals(Project.get(receiptInstance.projectId).status)) {
					flash.message = "Error: The project selected is already closed"
					render(view: "create", model: [receiptInstance: receiptInstance])
					return
				}
			}
		}
        if (!receiptInstance.save(flush: true)) {
            render(view: "create", model: [receiptInstance: receiptInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'receipt.label', default: 'Receipt'), receiptInstance.id])
        redirect(action: "show", id: receiptInstance.id)
    }

    def show() {
        def receiptInstance = Receipt.get(params.id)
        if (!receiptInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'receipt.label', default: 'Receipt'), params.id])
            redirect(action: "list")
            return
        }

        [receiptInstance: receiptInstance]
    }

    def edit() {
        def receiptInstance = Receipt.get(params.id)
        if (!receiptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'receipt.label', default: 'Receipt'), params.id])
            redirect(action: "list")
            return
        }

        [receiptInstance: receiptInstance]
    }

    def update() {
        def receiptInstance = Receipt.get(params.id)
        if (!receiptInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'receipt.label', default: 'Receipt'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (receiptInstance.version > version) {
                receiptInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'receipt.label', default: 'Receipt')] as Object[],
                          "Another user has updated this Receipt while you were editing")
                render(view: "edit", model: [receiptInstance: receiptInstance])
                return
            }
        }

        receiptInstance.properties = params

        if (!receiptInstance.save(flush: true)) {
            render(view: "edit", model: [receiptInstance: receiptInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'receipt.label', default: 'Receipt'), receiptInstance.id])
        redirect(action: "show", id: receiptInstance.id)
    }

    def delete() {
        def receiptInstance = Receipt.get(params.id)
        if (!receiptInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'receipt.label', default: 'Receipt'), params.id])
            redirect(action: "list")
            return
        }

        try {
            receiptInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'receipt.label', default: 'Receipt'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'receipt.label', default: 'Receipt'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def processEntityNameValueChange() {
		println "in value change: ${params.entityName}"
				
		def ownerList 
				
		switch (params.entityName) {
			case "MEMBER": ownerList = Member.list(); break
			case "CELLGROUP": ownerList = CellGroup.list(); break
			case "DEPARTMENT": ownerList = Department.list(); break
			case "FELLOWSHIPGROUP": ownerList = FellowshipGroup.list(); break
			case "PLEDGE": ownerList = Pledge.list(); break
			default: ownerList = []; break
		}
		
		println "list size: ${ownerList?.size()}"
		
		render template: "ownerselect", model: [ ownerList: ownerList ]
				
	}
	
	def processTypeValueChange() {
		println "in value change: ${params.type}"
				
		def projectList
				
		switch (params.type) {
			case "PROJECT CASH": projectList = Project.list(); break
			case "PLEDGE PAYMENT": projectList = Project.list(); break
			default: projectList = []; break
		}
		
		println "list size: ${projectList?.size()}"
		
		render template: "projectselect", model: [ projectList: projectList ]
		
	}
	
	def getReceiptOwner() {
		
		def entityName = params.entityName
		def entityId = params.entityId
		
		if (entityName && entityId) {
			switch(entityName) {
				case "MEMBER": Member.get(entityId); break
				case "CELLGROUP": CellGroup.get(entityId).name; break
				case "DEPARTMENT": Department.get(entityId).name; break
				case "FELLOWSHIPGROUP": FellowshipGroup.get(entityId).name; break
				case "PLEDGE": Pledge.get(entityId).member; break
				default: ""; break
			}
		}
	}
	
	def doSearch() {
		
		def today = new Date()

		println "project id is: ${params.projectId}"
		
		def receiptList = Receipt.withCriteria {
			
			and {
				
				if (params.type) {
					eq('type', params.type)
				}
				
				if (params.entityName) {
					eq('entityName', params.entityName)
				}
				
				if (params.entityId) {
					eq('entityId', params.entityId)
				}
				
				if (params.projectId) {
					eq('projectId', params.projectId)
				}
				
				if (params.valueDate) {
					eq('valueDate', params.valueDate)
				}
				
				if (params.dateFrom || params.dateTo) {
					
					if (params.dateTo) {
						
						def dateTo = new Date()
						dateTo.year = params.dateTo_year?.toInteger()
						dateTo.month = params.dateTo_month?.toInteger()
						dateTo.date = params.dateTo_day?.toInteger()
						dateTo.hours = 23
						dateTo.minutes = 59
						dateTo.seconds = 59
						
						if (params.dateFrom) {
							
							between('dateCreated', params.dateFrom, dateTo)
							
						} else {
							between('dateCreated', new Date(0), dateTo)
						}
					} else {
						between('dateCreated', params.dateFrom, new Date())
					}
				}
				
			}
			
		}
		println receiptList?.size()
		
		if (receiptList) {
			flash.message = "${receiptList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
		
		render template:"listbody", model:[receiptInstanceList: receiptList, receiptInstanceTotal: receiptList?.size()]
		
	}
}
