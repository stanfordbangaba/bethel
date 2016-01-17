package zw.co.bangsoft.bethel.model

class AgeGroup {

	Organisation organisation
	String name
	int minimumAge
	int maximumAge
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		organisation nullable: false
		name blank:false, maxSize: 50, unique: true
		minimumAge blank: false, range: 1..100
		maximumAge blank: false, range: 1..150, validator: { maxAge, ageGroup ->  
			maxAge > ageGroup.minimumAge 
		}
		dateCreated()
		lastUpdated()
    }
	
	String toString() {
		name
	}
	
	def beforeInsert = {
		name = name.toUpperCase()
	}
	
	def beforeUpdate = {
		beforeInsert()
	}
}
