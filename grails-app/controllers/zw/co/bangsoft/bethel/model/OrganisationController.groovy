package zw.co.bangsoft.bethel.model

import org.springframework.dao.DataIntegrityViolationException

class OrganisationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [organisationInstanceList: Organisation.list(params), organisationInstanceTotal: Organisation.count()]
    }

    def create() {
        [organisationInstance: new Organisation(params)]
    }

    def save() {
        def organisationInstance = new Organisation(params)
        if (!organisationInstance.save(flush: true)) {
            render(view: "create", model: [organisationInstance: organisationInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'organisation.label', default: 'Organisation'), organisationInstance.id])
        redirect(action: "show", id: organisationInstance.id)
    }

    def show() {
        def organisationInstance = Organisation.get(params.id)
        if (!organisationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisation.label', default: 'Organisation'), params.id])
            redirect(action: "list")
            return
        }

        [organisationInstance: organisationInstance]
    }

    def edit() {
        def organisationInstance = Organisation.get(params.id)
        if (!organisationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisation.label', default: 'Organisation'), params.id])
            redirect(action: "list")
            return
        }

        [organisationInstance: organisationInstance]
    }

    def update() {
        def organisationInstance = Organisation.get(params.id)
        if (!organisationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisation.label', default: 'Organisation'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (organisationInstance.version > version) {
                organisationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'organisation.label', default: 'Organisation')] as Object[],
                          "Another user has updated this Organisation while you were editing")
                render(view: "edit", model: [organisationInstance: organisationInstance])
                return
            }
        }

        organisationInstance.properties = params

        if (!organisationInstance.save(flush: true)) {
            render(view: "edit", model: [organisationInstance: organisationInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'organisation.label', default: 'Organisation'), organisationInstance.id])
        redirect(action: "show", id: organisationInstance.id)
    }

    def delete() {
        def organisationInstance = Organisation.get(params.id)
        if (!organisationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisation.label', default: 'Organisation'), params.id])
            redirect(action: "list")
            return
        }

        try {
            organisationInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'organisation.label', default: 'Organisation'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'organisation.label', default: 'Organisation'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
