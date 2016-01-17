package zw.co.bangsoft.bethel.model

class Family {

	static searchable = true
	
	CellGroup cellGroup
	String name
	String landline
	String cellphone
	String street
	String suburb
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		cellGroup nullable: false
		name blank: false, maxSize: 60
		landline nullable: true, maxSize: 20
		cellphone nullable: true, maxSize: 15
		street nullable: true, maxSize: 50
		suburb nullable: true, maxSize: 30
		dateCreated()
		lastUpdated()
    }
	
	static mapping = {
		sort name:"desc"
	}
	
	static hasMany = [ members : Member ]
	
	
	String toString() {
		"${name} [ ${cellGroup.name} ]"
	}
	
	def beforeInsert = {
		name = name.toUpperCase()
		street = street?.toUpperCase()
		suburb = suburb?.toUpperCase()
	}
	
	def beforeUpdate = {
		beforeInsert()
	}

}