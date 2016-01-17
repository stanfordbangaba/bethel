package zw.co.bangsoft.bethel.model

class Project {

	Assembly assembly
	String name
	String description
	BigDecimal targetAmount
	Date dateOpened
	Date dateClosed
	String status
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		assembly nullable: false
		name blank: false, maxSize: 50, unique: true
		description nullable: true, maxSize: 100
		targetAmount scale: 2, validator: { it > 0 }
		dateOpened nullable: false
		dateClosed nullable: true
		status inList: ["OPEN", "CLOSED"], blank: false
		dateCreated()
		lastUpdated()
		
    }
	
	static mapping = {
		sort dateCreated: "desc"
	}
	
	static hasMany = [ pledges : Pledge ]
	
	
	String toString() {
		"${name} [${dateOpened}]"
	}
	
	def beforeInsert = {
		name = name.toUpperCase()
	}
	
	def beforeUpdate = {
		beforeInsert()
	}
}
