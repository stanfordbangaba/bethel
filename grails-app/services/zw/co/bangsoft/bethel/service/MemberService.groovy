package zw.co.bangsoft.bethel.service

import zw.co.bangsoft.bethel.model.AgeGroup;
import zw.co.bangsoft.bethel.model.Member;

class MemberService {
	
    def findMembers(Map params) {
		
		def minimumAge, maximumAge, today = new Date(), minimumDate, maximumDate
		
		params?.each { println it }
		
		if (params.get('ageGroup.id')) {
			def ageGroup = AgeGroup.get(params.ageGroup.id.toLong())
			minimumAge = ageGroup.minimumAge
			maximumAge = ageGroup.maximumAge
		} else {
			minimumAge = params.minimumAge
			maximumAge = params.maximumAge
		}
		
		if (maximumAge) {
			minimumDate = new Date(year: today.year - maximumAge.toInteger())
		} 
		
		if (minimumAge) {
			maximumDate = new Date(year: today.year - minimumAge.toInteger())
		} 
		
		Member.withCriteria {
			
			and {
				
				if (params.family?.id) {
					eq('family.id', params.family.id.toLong())
				}
				
				if (params.lastName) {
					ilike('lastName', "%${params.lastName}%")
				}
						
				if (params.gender) {
					eq('gender', params.gender)
				}
				
				if (params.maritalStatus) {
					eq('maritalStatus', params.maritalStatus)
				}
				
				if (params.familyRelationship) {
					eq('familyRelationship', params.familyRelationship)
				}
				
				if (params.dateFrom || params.dateTo) {
					
					if (params.dateTo) {
						
						def dateTo = new Date()
						dateTo.year = params.dateTo_year?.toInteger()
						dateTo.month = params.dateTo_month?.toInteger()
						dateTo.date = params.dateTo_day?.toInteger()
						dateTo.hours = 23
						dateTo.minutes = 59
						dateTo.seconds = 59
						
						if (params.dateFrom) {
							
							between('dateCreated', params.dateFrom, dateTo)
							
						} else {
							between('dateCreated', new Date(0), dateTo)
						}
					} else {
						between('dateCreated', params.dateFrom, new Date())
					}
				}
				
				if (minimumAge && maximumAge) {
					
					between('dateOfBirth', minimumDate, maximumDate)
								
				} else if (maximumAge){
							
					between('dateOfBirth', minimumDate, today)
							
				} else if (minimumAge) {
						
					between('dateOfBirth', new Date(0L), maximumDate)
						
				} 
				
			}
		}
    }
}
