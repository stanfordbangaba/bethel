package bethel

import zw.co.bangsoft.bethel.model.*;

class BethelTagLib {
	
	static namespace = "bang"
	
	def receiptOwner = { attrs ->
		
		def entityName = attrs.entityName
		def entityId = attrs.entityId
		def owner
		
		if (entityName && entityId) {
			switch(entityName) {
				case "MEMBER": owner = Member.get(entityId); break
				case "CELLGROUP": owner = CellGroup.get(entityId).name; break
				case "DEPARTMENT": owner = Department.get(entityId).name; break
				case "FELLOWSHIPGROUP": owner = FellowshipGroup.get(entityId).name; break
				case "PLEDGE": owner = Pledge.get(entityId).member; break
				default: owner = ""; break
			}
		}
		
		out << owner
		
	}
	
	def total = { attrs ->
		
		def instanceList = attrs.collection
		def var = attrs.var
		
		def total = 0
		
		instanceList?.each { total += it."$var" }
		
		out << total
	}
	
	def balance = { attrs ->
		
		def instanceList = attrs.collection
		def var = attrs.var
		def targetAmount = attrs.targetAmount
		
		def total = 0
		
		instanceList?.each { total += it."$var" }
		
		out << total - targetAmount 
		
	}
	
	def exportFormats = { attrs ->
				
		out << "${actionSubmit(value:'PDF', class: 'pdf', action: 'pdfReport')}"
		out << "${actionSubmit(value:'EXCEL', class: 'excel', action: 'excelReport')}"
		out << "${actionSubmit(value:'CSV', class: 'csv', action: 'csvReport')}"
			
	}

}
