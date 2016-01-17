package zw.co.bangsoft.bethel.model

class Member {
	
	static searchable = true

	Family family
	String lastName
	String firstName
	Date dateOfBirth
	String nationalId
	String gender
	String maritalStatus
	String familyRelationship
	String email
	String landline
	String cellphone
	String street
	String suburb
	String employer
	String workTitle
	String levelOfStudy
	String studyDescription
	String sportInterests
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		family nullable: false
		lastName blank: false, maxSize: 30
		firstName blank: false, maxSize: 30
		dateOfBirth blank: false, validator: { it < new Date() }
		nationalId nullable: true, maxSize: 15
		gender inList: [ "M", "F"], blank: false
		maritalStatus inList: [ "SINGLE", "MARRIED", "WIDOWED" ], blank: false
		familyRelationship inList: [ "HEAD", "WIFE", "CHILD", "OTHER" ], blank: false,
			validator: { fr, member -> 
					if ("WIFE".equals(fr)) { "F".equals(member.gender) }
				}
		email nullable: true, maxSize: 40, email: true
		landline nullable: true, maxSize: 20
		cellphone nullable: true, maxSize: 15
		street nullable: true, maxSize: 40
		suburb nullable: true, maxSize: 30
		employer nullable: true, maxSize: 80
		workTitle nullable: true, maxSize: 40
		levelOfStudy inList: [ "NONE", "CERTIFICATE", "DIPLOMA", "HND", "DEGREE", "MASTERS", "DOCTORATE" ]
		studyDescription nullable: true, maxSize: 120
		sportInterests nullable: true, maxSize: 80
		dateCreated()
		lastUpdated()
    }
	
	static mapping = {
		sort lastName:"desc"
	}
	
	static hasMany = [ positions: Position, departmets: Department, fellowshipGroups: FellowshipGroup, pledges: Pledge ]
	
	String toString() {
		"${lastName} ${firstName}"
	}
	
	def beforeInsert = {
		lastName = lastName.toUpperCase()
		firstName = firstName.toUpperCase()
		nationalId = nationalId?.toUpperCase()
		street = street?.toUpperCase()
		suburb = suburb?.toUpperCase()
		employer = employer?.toUpperCase()
		workTitle = workTitle?.toUpperCase()
		studyDescription = studyDescription?.toUpperCase()
		sportInterests = sportInterests?.toUpperCase()
		
	}
	
	def beforeUpdate = {
		beforeInsert()
	}
}
