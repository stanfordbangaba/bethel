package zw.co.bangsoft.bethel.model

import java.util.Date;

class Department {

	static searchable = true
	
	Assembly assembly
    String name
	String leaderName
	String contactPhone
	String description
	Date dateCreated
	Date lastUpdated

    static constraints = {
		assembly nullable: false
		name blank: false, maxSize: 50
		leaderName nullable: true, maxSize: 50
		contactPhone nullable: true, maxSize: 20
		description nullable: true, maxSize: 100
		dateCreated()
		lastUpdated()
    }
	
	static mapping = {
		sort name:"desc"
	}
	
	static belongsTo = [ Assembly, Member ]
	static hasMany = [ members : Member ]
	
	String toString() {
		name
	}
	
	def beforeInsert = {
		name = name.toUpperCase()
		leaderName = leaderName?.toUpperCase()
	}
	
	def beforeUpdate = {
		beforeInsert()
	}
	
}
