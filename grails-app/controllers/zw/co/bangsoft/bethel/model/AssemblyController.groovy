package zw.co.bangsoft.bethel.model

import org.springframework.dao.DataIntegrityViolationException

class AssemblyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assemblyInstanceList: Assembly.list(params), assemblyInstanceTotal: Assembly.count()]
    }

    def create() {
        [assemblyInstance: new Assembly(params)]
    }

    def save() {
        def assemblyInstance = new Assembly(params)
        if (!assemblyInstance.save(flush: true)) {
            render(view: "create", model: [assemblyInstance: assemblyInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'assembly.label', default: 'Assembly'), assemblyInstance.id])
        redirect(action: "show", id: assemblyInstance.id)
    }

    def show() {
        def assemblyInstance = Assembly.get(params.id)
        if (!assemblyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'assembly.label', default: 'Assembly'), params.id])
            redirect(action: "list")
            return
        }

        [assemblyInstance: assemblyInstance]
    }

    def edit() {
        def assemblyInstance = Assembly.get(params.id)
        if (!assemblyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assembly.label', default: 'Assembly'), params.id])
            redirect(action: "list")
            return
        }

        [assemblyInstance: assemblyInstance]
    }

    def update() {
        def assemblyInstance = Assembly.get(params.id)
        if (!assemblyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'assembly.label', default: 'Assembly'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (assemblyInstance.version > version) {
                assemblyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'assembly.label', default: 'Assembly')] as Object[],
                          "Another user has updated this Assembly while you were editing")
                render(view: "edit", model: [assemblyInstance: assemblyInstance])
                return
            }
        }

        assemblyInstance.properties = params

        if (!assemblyInstance.save(flush: true)) {
            render(view: "edit", model: [assemblyInstance: assemblyInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'assembly.label', default: 'Assembly'), assemblyInstance.id])
        redirect(action: "show", id: assemblyInstance.id)
    }

    def delete() {
        def assemblyInstance = Assembly.get(params.id)
        if (!assemblyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'assembly.label', default: 'Assembly'), params.id])
            redirect(action: "list")
            return
        }

        try {
            assemblyInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'assembly.label', default: 'Assembly'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'assembly.label', default: 'Assembly'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
