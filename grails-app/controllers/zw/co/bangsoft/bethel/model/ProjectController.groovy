package zw.co.bangsoft.bethel.model

import org.springframework.dao.DataIntegrityViolationException

class ProjectController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [projectInstanceList: Project.list(params), projectInstanceTotal: Project.count()]
		[:]
    }

    def create() {
        [projectInstance: new Project(params)]
    }

    def save() {
        def projectInstance = new Project(params)
		
        if (!projectInstance.save(flush: true)) {
            render(view: "create", model: [projectInstance: projectInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
        redirect(action: "show", id: projectInstance.id)
    }

    def show() {
        def projectInstance = Project.get(params.id)
        if (!projectInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
            redirect(action: "list")
            return
        }

        [projectInstance: projectInstance]
    }

    def edit() {
        def projectInstance = Project.get(params.id)
        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
            redirect(action: "list")
            return
        }

        [projectInstance: projectInstance]
    }

    def update() {
        def projectInstance = Project.get(params.id)
		
		if ("CLOSED".equals(projectInstance.status)) {
			if (!projectInstance.dateClosed) {
				println "closing this project"
				projectInstance.dateClosed = new Date()
			} 
		}
		
        if (!projectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (projectInstance.version > version) {
                projectInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'project.label', default: 'Project')] as Object[],
                          "Another user has updated this Project while you were editing")
                render(view: "edit", model: [projectInstance: projectInstance])
                return
            }
        }

        projectInstance.properties = params

        if (!projectInstance.save(flush: true)) {
            render(view: "edit", model: [projectInstance: projectInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
        redirect(action: "show", id: projectInstance.id)
    }

    def delete() {
        def projectInstance = Project.get(params.id)
        if (!projectInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
            redirect(action: "list")
            return
        }

        try {
            projectInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'project.label', default: 'Project'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def doSearch() {
		
		def projectList = Project.withCriteria {
					
			and {
						
				if (params.name) {
					ilike('name', "%${params.name}%")
				}
						
				if (params.description) {
					ilike('description', "%${params.description}%")
				}
							
				if (params.dateOpened) {
					
					def searchDate = params.dateOpened
					searchDate.date = 1
					searchDate.month = 0
					
					println "From date: ${searchDate}"
					println "To Date: ${searchDate + 365}"
					
					between('dateOpened', searchDate, searchDate + 365)
					
				}
						
			}
		}
		
		println projectList?.size()
				
		if (projectList) {
			flash.message = "${projectList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
				
		render template:"listbody", model:[projectInstanceList: projectList, projectInstanceTotal: projectList?.size()]
				
	}
	
	def receipts() {
		println "project id = ${params.id}"
		def receiptList = Receipt.findAllByProjectId(params.id)
		println "receipts = ${receiptList?.size}"
		
		[projectInstance: Project.get(params.id), receiptInstanceList: receiptList, receiptInstanceTotal: receiptList?.size()]
	}
	
	def pledges() {
		println "project id = ${params.id}"
		def project = Project.get(params.id)
		def pledgeList = Pledge.findAllByProject(project)
		println "pledges = ${pledgeList?.size}"
		
		[projectInstance: project, pledgeInstanceList: pledgeList, pledgeInstanceTotal: pledgeList?.size()]
	}
	
	def summary() {
		def project = Project.get(params.id)
		def receiptList = Receipt.findAllByProjectId(params.id)
		def pledgeList = Pledge.findAllByProject(project)
		
		def cashReceiptsTotal = 0, totalPledges = 0, paidPledgesTotal = 0
		
		receiptList?.each { 
			if (it.type == "PROJECT CASH") cashReceiptsTotal += it.amount 
			if (it.type == "PLEDGE PAYMENT") paidPledgesTotal += it.amount 
		}
		
		pledgeList?.each { totalPledges += it.amount }
		
		println "totalCashReceipts ${cashReceiptsTotal}"
		
		[ projectInstance: project, cashReceiptsTotal: cashReceiptsTotal, pledgeTotal: totalPledges, paidPledgesTotal: paidPledgesTotal ] 
	}
}
