package zw.co.bangsoft.bethel.model

import org.springframework.dao.DataIntegrityViolationException

class PledgeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [pledgeInstanceList: Pledge.list(params), pledgeInstanceTotal: Pledge.count()]
		[:]
    }

    def create() {
        [pledgeInstance: new Pledge(params)]
    }

    def save() {
        def pledgeInstance = new Pledge(params)
		
		if ("CLOSED".equals(Project.get(params.project?.id).status)) {
			flash.message = "Error: The project selected is already closed"
			render(view: "create", model: [pledgeInstance: pledgeInstance])
			return
		}
		
        if (!pledgeInstance.save(flush: true)) {
            render(view: "create", model: [pledgeInstance: pledgeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'pledge.label', default: 'Pledge'), pledgeInstance.id])
        redirect(action: "show", id: pledgeInstance.id)
    }

    def show() {
        def pledgeInstance = Pledge.get(params.id)
        if (!pledgeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledge.label', default: 'Pledge'), params.id])
            redirect(action: "list")
            return
        }

        [pledgeInstance: pledgeInstance]
    }

    def edit() {
        def pledgeInstance = Pledge.get(params.id)
        if (!pledgeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledge.label', default: 'Pledge'), params.id])
            redirect(action: "list")
            return
        }

        [pledgeInstance: pledgeInstance]
    }

    def update() {
        def pledgeInstance = Pledge.get(params.id)
        if (!pledgeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledge.label', default: 'Pledge'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (pledgeInstance.version > version) {
                pledgeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pledge.label', default: 'Pledge')] as Object[],
                          "Another user has updated this Pledge while you were editing")
                render(view: "edit", model: [pledgeInstance: pledgeInstance])
                return
            }
        }

        pledgeInstance.properties = params

        if (!pledgeInstance.save(flush: true)) {
            render(view: "edit", model: [pledgeInstance: pledgeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'pledge.label', default: 'Pledge'), pledgeInstance.id])
        redirect(action: "show", id: pledgeInstance.id)
    }

    def delete() {
        def pledgeInstance = Pledge.get(params.id)
        if (!pledgeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pledge.label', default: 'Pledge'), params.id])
            redirect(action: "list")
            return
        }

        try {
            pledgeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'pledge.label', default: 'Pledge'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pledge.label', default: 'Pledge'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def doSearch() {
				
		def pledgeList = Pledge.withCriteria {
					
			and {
						
				if (params.project?.id) {
					eq('project.id', params.project.id.toLong())
				}
						
				if (params.member?.id) {
					eq('member.id', params.member.id.toLong())
				}
						
				if (params.valueDate) {
					eq('valueDate', params.valueDate)
				}
						
			}
		}
		
		println pledgeList?.size()
				
		if (pledgeList) {
			flash.message = "${pledgeList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
				
		render template:"listbody", model:[pledgeInstanceList: pledgeList, pledgeInstanceTotal: pledgeList?.size()]
				
	}
}
