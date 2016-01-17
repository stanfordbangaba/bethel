package zw.co.bangsoft.bethel.model

import groovy.sql.Sql;

import java.awt.Color;
import java.text.SimpleDateFormat;

import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat;
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef;
import org.springframework.dao.DataIntegrityViolationException

class MemberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def memberService
	def exportService
	def jasperService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [memberInstanceList: Member.list(params), memberInstanceTotal: Member.count()]
		
		[:]
    }

    def create() {
        [memberInstance: new Member(params)]
    }

    def save() {
        def memberInstance = new Member(params)
        if (!memberInstance.save(flush: true)) {
            render(view: "create", model: [memberInstance: memberInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])
        redirect(action: "show", id: memberInstance.id)
    }

    def show() {
        def memberInstance = Member.get(params.id)
        if (!memberInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])
            redirect(action: "list")
            return
        }

        [memberInstance: memberInstance]
    }

    def edit() {
        def memberInstance = Member.get(params.id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])
            redirect(action: "list")
            return
        }

        [memberInstance: memberInstance]
    }

    def update() {
        def memberInstance = Member.get(params.id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (memberInstance.version > version) {
                memberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'member.label', default: 'Member')] as Object[],
                          "Another user has updated this Member while you were editing")
                render(view: "edit", model: [memberInstance: memberInstance])
                return
            }
        }

        memberInstance.properties = params

        if (!memberInstance.save(flush: true)) {
            render(view: "edit", model: [memberInstance: memberInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])
        redirect(action: "show", id: memberInstance.id)
    }

    def delete() {
        def memberInstance = Member.get(params.id)
        if (!memberInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])
            redirect(action: "list")
            return
        }

        try {
            memberInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'member.label', default: 'Member'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'member.label', default: 'Member'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def search() {
				
		def memberList = memberService.findMembers(params)
		
		println memberList?.size()
		
		if (memberList) {
			flash.message = "${memberList.size} result(s) found"
		} else {
			flash.message = "No results found"
		}
		
		render template:"listbody", model:[memberInstanceList: memberList, memberInstanceTotal: memberList?.size()]
		
	}
	
	def report() {
		
		def memberList
		
		if(params?.format && params.format != "html"){
			
			def today = new Date().calendarDate
						
			def filename = "member_report_${today.dayOfMonth}-${today.month}-${today.year}"
						
			def reportTitle = params.reportTitle ?: 'Member List'
			
			response.contentType = grailsApplication.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=${filename}.${params.extension}")

			List fields = ["lastName", "firstName", "dateOfBirth", "gender", "maritalStatus", "street", "suburb"]
			Map labels = ["lastName": "Lastname", "firstName": "Firstname", "dateOfBirth": "Date Of Birth", 
							"gender": "Gender", "maritalStatus": "Marital Status","street": "Street", "suburb": "Suburb"]
		
			try {
				memberList = memberService.findMembers(params)
				memberList << new Member(lastName: "Total:", firstName: memberList?.size())
			} catch(e) { }
												
		   // Formatter closure
		   def upper = { domain, name ->
			   
			   return name.toUpperCase()
			   
		   }
		   
		   def ddMMyyyyFormat = { domain, dateOfBirth -> 
			   
			   if (dateOfBirth) {
				   new SimpleDateFormat("dd/MM/yyyy").format(dateOfBirth)
			   }
		   }
		   
		   def assembly = memberList?.get(0)?.family?.cellGroup?.assembly
		   
		   Map formatters = [ firstName: upper, lastName: upper, dateOfBirth:  ddMMyyyyFormat ]
		   
		   List headers = [['Hooray!!']]
			
		   Map parameters = [ title: "${assembly?.name}: ${reportTitle}", "column.widths": [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], 
			   					"title.font.size": 12, "header": "headers", "header.rows": "2" ]
		   
		   exportService.export(params.format, response.outputStream, memberList, fields, labels, formatters, parameters)
		
		}
				
	}
	
	def pdfReport() {
				
	  	forward(action: "report", params: params << [ "format": "pdf", "extension": "pdf" ])
	   
		  println ">> last"
	}
	
	def excelReport() {
				
		forward(action: "report", params: params << [ "format": "excel", "extension": "xls" ])
		
	}
	
	def csvReport() {
		
		forward(action: "report", params: params << [ "format": "csv", "extension": "csv" ])
		
	}
	
	def jasperReport() {
		
		def db = Sql.newInstance(
					'jdbc:h2:mem:testDb;MVCC=TRUE',
					'sa',
					'',
					'org.h2.Driver')
				
		def reportDef = new JasperReportDef(
			name: 'member_report.jasper', 
			fileFormat: JasperExportFormat.PDF_FORMAT,
			parameters: ['reportTitle': 'Member Report'],
			reportData: db.rows("SELECT * from Member"))
		
		def writer = response.outputStream
		
		writer <<  jasperService.generateReport(reportDef).toByteArray()
				
	}
}
