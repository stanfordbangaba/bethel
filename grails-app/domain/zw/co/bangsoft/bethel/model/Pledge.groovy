package zw.co.bangsoft.bethel.model

class Pledge {

	Date dateCreated
	Project project
	Member member
	BigDecimal amount
	Date valueDate
	Date lastUpdated
	
    static constraints = {
		dateCreated()
		project nullable: false
		member nullable: false
		amount scale: 2, validator: { it > 0 }
		valueDate blank: false
		lastUpdated()
		
    }
	
	static mapping = {
		sort dateCreated: "desc"
	}
		
	static belongsTo = [ Member, Project ]
	
	String toString() {
		"${project} [${member}]"
	}
}
