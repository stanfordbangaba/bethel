package zw.co.bangsoft.bethel.model

import org.springframework.dao.DataIntegrityViolationException

class CellGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cellGroupInstanceList: CellGroup.list(params), cellGroupInstanceTotal: CellGroup.count()]
    }

    def create() {
        [cellGroupInstance: new CellGroup(params)]
    }

    def save() {
        def cellGroupInstance = new CellGroup(params)
        if (!cellGroupInstance.save(flush: true)) {
            render(view: "create", model: [cellGroupInstance: cellGroupInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'cellGroup.label', default: 'CellGroup'), cellGroupInstance.id])
        redirect(action: "show", id: cellGroupInstance.id)
    }

    def show() {
        def cellGroupInstance = CellGroup.get(params.id)
        if (!cellGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cellGroup.label', default: 'CellGroup'), params.id])
            redirect(action: "list")
            return
        }

        [cellGroupInstance: cellGroupInstance]
    }

    def edit() {
        def cellGroupInstance = CellGroup.get(params.id)
        if (!cellGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cellGroup.label', default: 'CellGroup'), params.id])
            redirect(action: "list")
            return
        }

        [cellGroupInstance: cellGroupInstance]
    }

    def update() {
        def cellGroupInstance = CellGroup.get(params.id)
        if (!cellGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cellGroup.label', default: 'CellGroup'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cellGroupInstance.version > version) {
                cellGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cellGroup.label', default: 'CellGroup')] as Object[],
                          "Another user has updated this CellGroup while you were editing")
                render(view: "edit", model: [cellGroupInstance: cellGroupInstance])
                return
            }
        }

        cellGroupInstance.properties = params

        if (!cellGroupInstance.save(flush: true)) {
            render(view: "edit", model: [cellGroupInstance: cellGroupInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'cellGroup.label', default: 'CellGroup'), cellGroupInstance.id])
        redirect(action: "show", id: cellGroupInstance.id)
    }

    def delete() {
        def cellGroupInstance = CellGroup.get(params.id)
        if (!cellGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cellGroup.label', default: 'CellGroup'), params.id])
            redirect(action: "list")
            return
        }

        try {
            cellGroupInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'cellGroup.label', default: 'CellGroup'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cellGroup.label', default: 'CellGroup'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def search() {
		[:]
	}
	
	def doSearch() {
		
		def memberList
		
		if (params.cellGroup?.id) {
			memberList = CellGroup.get(params.cellGroup?.id).families?.collect { it.members }?.flatten()
		} 
		
		println memberList?.size()
		
		if (memberList) {
			flash.message = "${memberList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
		
		render template:"/member/listbody", model:[memberInstanceList: memberList, memberInstanceTotal: memberList?.size()]
		
	}
}
