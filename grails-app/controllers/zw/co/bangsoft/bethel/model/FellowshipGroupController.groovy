package zw.co.bangsoft.bethel.model

import org.springframework.dao.DataIntegrityViolationException

class FellowshipGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def memberService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fellowshipGroupInstanceList: FellowshipGroup.list(params), fellowshipGroupInstanceTotal: FellowshipGroup.count()]
    }

    def create() {
        [fellowshipGroupInstance: new FellowshipGroup(params)]
    }

    def save() {
        def fellowshipGroupInstance = new FellowshipGroup(params)
        if (!fellowshipGroupInstance.save(flush: true)) {
            render(view: "create", model: [fellowshipGroupInstance: fellowshipGroupInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup'), fellowshipGroupInstance.id])
        redirect(action: "show", id: fellowshipGroupInstance.id)
    }

    def show() {
        def fellowshipGroupInstance = FellowshipGroup.get(params.id)
        if (!fellowshipGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup'), params.id])
            redirect(action: "list")
            return
        }

        [fellowshipGroupInstance: fellowshipGroupInstance]
    }

    def edit() {
        def fellowshipGroupInstance = FellowshipGroup.get(params.id)
        if (!fellowshipGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup'), params.id])
            redirect(action: "list")
            return
        }

        [fellowshipGroupInstance: fellowshipGroupInstance]
    }

    def update() {
        def fellowshipGroupInstance = FellowshipGroup.get(params.id)
        if (!fellowshipGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (fellowshipGroupInstance.version > version) {
                fellowshipGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup')] as Object[],
                          "Another user has updated this FellowshipGroup while you were editing")
                render(view: "edit", model: [fellowshipGroupInstance: fellowshipGroupInstance])
                return
            }
        }

        fellowshipGroupInstance.properties = params

        if (!fellowshipGroupInstance.save(flush: true)) {
            render(view: "edit", model: [fellowshipGroupInstance: fellowshipGroupInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup'), fellowshipGroupInstance.id])
        redirect(action: "show", id: fellowshipGroupInstance.id)
    }

    def delete() {
        def fellowshipGroupInstance = FellowshipGroup.get(params.id)
        if (!fellowshipGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup'), params.id])
            redirect(action: "list")
            return
        }

        try {
            fellowshipGroupInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def search() { 
		[:]
	}
	
	def doSearch() {
				
		def memberList 
				
		try {
			memberList = memberService.findMembers(params)
		} catch(e) { }
			
		println memberList?.size()
		
		if (memberList) {
			flash.message = "${memberList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
		
		render template:"/member/listbody", model:[memberInstanceList: memberList, memberInstanceTotal: memberList?.size()]
		
	}
}
