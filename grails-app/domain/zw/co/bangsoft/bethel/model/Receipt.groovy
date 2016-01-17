package zw.co.bangsoft.bethel.model

class Receipt {
	
	Date dateCreated
	Assembly assembly
	String receiptNo
	String narrative
	Date valueDate
	String type
	String otherType
	BigDecimal amount
	Date lastUpdated
	String entityName
	String entityId
	String projectId
	
    static constraints = {
		dateCreated()
		assembly nullable: false
		receiptNo blank: false, maxSize: 30, unique: true
		narrative nullable: true
		valueDate blank: false
		type inList: [ 
				"TITHE", 
				"SUBSCRIPTION", 
				"OFFERING", 
				"SALES", 
				"PROJECT CASH", 
				"PLEDGE PAYMENT",
				"OTHER" 
			]
		otherType nullable: true, maxSize: 30
		amount scale: 2, validator: { it > 0 }
		lastUpdated()
		entityName nullable: false, inList: [ 
				"MEMBER", 
				"CELLGROUP", 
				"DEPARTMENT", 
				"FELLOWSHIPGROUP",
			]
		
		entityId nullable: false, maxSize: 30
		projectId nullable: true, maxSize: 30
    }
	
	static mapping = {
		sort dateCreated: "desc"
	}	
	
	String toString() {
		"${receiptNo} [${valueDate}]"
	}
	
	def beforeInsert = {
		receiptNo = receiptNo.toUpperCase()
		entityName = entityName.toUpperCase()
	}
	
	def beforeUpdate = {
		beforeInsert()
	}
}
