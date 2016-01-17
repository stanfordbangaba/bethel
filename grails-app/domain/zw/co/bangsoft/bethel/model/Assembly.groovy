package zw.co.bangsoft.bethel.model

class Assembly {

	static searchable = true
	
	Organisation organisation
	String name
	String pastorName
	String email
	String landline
	String cellphone
	String street
	String suburb
	String city
	String country
	
    static constraints = {
		organisation nullable: false
		name blank: false, maxSize: 50, unique: true
		pastorName blank: false, maxSize: 60
		email nullable: true, maxSize: 30, email: true
		landline nullable: true, maxSize: 20
		cellphone nullable: true, maxSize: 15
		street nullable: true, maxSize: 30
		suburb nullable: true, maxSize: 30
		city nullable: true, maxSize: 30
		country nullable: true, maxSize: 30	
    }
	
	static mapping = {
		sort name:"desc"
	}
	
	static hasMany = [ cellGroups : CellGroup, departments: Department, fellowshipGroups: FellowshipGroup, projects: Project ]
	
	
	String toString() {
		name
	}
	
	def beforeInsert = {
		name = name.toUpperCase()
		pastorName = pastorName.toUpperCase()
		street = street?.toUpperCase()
		suburb = suburb?.toUpperCase()
		city = city?.toUpperCase()
		country = country?.toUpperCase()
	}
	
	def beforeUpdate = {
		beforeInsert()
	}
}
