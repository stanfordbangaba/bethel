import zw.co.bangsoft.bethel.model.Assembly;
import zw.co.bangsoft.bethel.model.CellGroup;
import zw.co.bangsoft.bethel.model.Family;
import zw.co.bangsoft.bethel.model.Member;
import zw.co.bangsoft.bethel.model.Organisation;
import zw.co.bangsoft.bethel.auth.*;

class BootStrap {

    def init = { servletContext ->
		
		try {
		
			//initialise admin user
			def user = new User(username: "admin", password: "amazing1", enabled: true)
			user.save()
			
			//configure spring security
			new Requestmap(url: '/js/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
			new Requestmap(url: '/css/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
			new Requestmap(url: '/images/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
			new Requestmap(url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
			new Requestmap(url: '/logout/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
			new Requestmap(url: '/*', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/organisation/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/assembly/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/agegroup/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/cellgroup/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/department/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/family/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/fellowshipgroup/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/member/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/user/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/role/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()
			new Requestmap(url: '/requestmap/**', configAttribute: 'IS_AUTHENTICATED_FULLY').save()			
			new Requestmap(url: '/**', configAttribute: 'IS_AUTHENTICATED_REMEMBERED').save()
		
		} catch (Exception e) {
			// TODO: handle exception
		}		
    }
    def destroy = {
    }
}
