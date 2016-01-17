package zw.co.bangsoft.bethel.model

class Position {

	String title
	String description
	
    static constraints = {
		title blank: false, maxSize: 30
		description nullable: true, maxSize: 150
    }
	
	static hasMany = [ members: Member ]
	
	static belongsTo = [ Member ]
	
	String toString() {
		title
	}
	
	def beforeInsert = {
		title = title.toUpperCase()
	}
	
	def beforeUpdate = {
		beforeInsert()
	}
	
}
