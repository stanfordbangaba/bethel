package zw.co.bangsoft.bethel.model

import org.springframework.dao.DataIntegrityViolationException

class AgeGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def memberService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ageGroupInstanceList: AgeGroup.list(params), ageGroupInstanceTotal: AgeGroup.count()]
    }

    def create() {
        [ageGroupInstance: new AgeGroup(params)]
    }

    def save() {
        def ageGroupInstance = new AgeGroup(params)
        if (!ageGroupInstance.save(flush: true)) {
            render(view: "create", model: [ageGroupInstance: ageGroupInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'ageGroup.label', default: 'AgeGroup'), ageGroupInstance.id])
        redirect(action: "show", id: ageGroupInstance.id)
    }

    def show() {
        def ageGroupInstance = AgeGroup.get(params.id)
        if (!ageGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ageGroup.label', default: 'AgeGroup'), params.id])
            redirect(action: "list")
            return
        }

        [ageGroupInstance: ageGroupInstance]
    }

    def edit() {
        def ageGroupInstance = AgeGroup.get(params.id)
        if (!ageGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ageGroup.label', default: 'AgeGroup'), params.id])
            redirect(action: "list")
            return
        }

        [ageGroupInstance: ageGroupInstance]
    }

    def update() {
        def ageGroupInstance = AgeGroup.get(params.id)
        if (!ageGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ageGroup.label', default: 'AgeGroup'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ageGroupInstance.version > version) {
                ageGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ageGroup.label', default: 'AgeGroup')] as Object[],
                          "Another user has updated this AgeGroup while you were editing")
                render(view: "edit", model: [ageGroupInstance: ageGroupInstance])
                return
            }
        }

        ageGroupInstance.properties = params

        if (!ageGroupInstance.save(flush: true)) {
            render(view: "edit", model: [ageGroupInstance: ageGroupInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ageGroup.label', default: 'AgeGroup'), ageGroupInstance.id])
        redirect(action: "show", id: ageGroupInstance.id)
    }

    def delete() {
        def ageGroupInstance = AgeGroup.get(params.id)
        if (!ageGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ageGroup.label', default: 'AgeGroup'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ageGroupInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ageGroup.label', default: 'AgeGroup'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ageGroup.label', default: 'AgeGroup'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def search() {
		[:]
	}
	
	def doSearch() {

		def memberList
		
		println "GGGGGGGGGG"
	
		try {	
			memberList = memberService.findMembers(params)
		} catch (e) { }
		
		println memberList?.size()
		
		if (memberList) {
			flash.message = "${memberList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
		
		render template:"/member/listbody", model:[memberInstanceList: memberList, memberInstanceTotal: memberList?.size()]
		
	}
}
