package zw.co.bangsoft.bethel.model

class Organisation {
	
	static searchable = true
	
	String name
	String email
	String landline
	String cellphone
	String street
	String suburb
	String city
	String country
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		name blank: false, maxSize: 50, unique: true
		email nullable: true, maxSize: 40, email: true
		landline nullable: true, maxSize: 15
		cellphone nullable: true, maxSize: 15
		street nullable: true, maxSize: 30
		suburb nullable: true, maxSize: 30
		city nullable: true, maxSize: 30
		country nullable: true, maxSize: 30		
		dateCreated()
		lastUpdated()
    }
	
	static mapping = {
		sort name:"desc"
	}
	
	static hasMany = [assemblies : Assembly]
	
	String toString() {
		name
	}
	
	def beforeInsert = {
		name = name.toUpperCase()
		street = street?.toUpperCase()
		suburb = suburb?.toUpperCase()
		city = city?.toUpperCase()
		country = country?.toUpperCase()
	}
	
	def beforeUpdate = {
		beforeInsert()
	}
}
