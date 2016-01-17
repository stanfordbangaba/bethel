<%@ page import="zw.co.bangsoft.bethel.model.Member" %>



<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'family', 'error')} required">
	<label for="family">
		<g:message code="member.family.label" default="Family" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="family" name="family.id" from="${zw.co.bangsoft.bethel.model.Family.list()}" 
			optionKey="id" required="" value="${memberInstance?.family?.id}" class="many-to-one"
			default="none" noSelection="['':'--Select--']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="member.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="30" required="" value="${memberInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="member.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="30" required="" value="${memberInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="member.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${memberInstance?.dateOfBirth}" required=""
						relativeYears="${-120..120}" default="none" noSelection="['':'--Select--']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'nationalId', 'error')} ">
	<label for="nationalId">
		<g:message code="member.nationalId.label" default="National Id" />
		
	</label>
	<g:textField name="nationalId" maxlength="15" value="${memberInstance?.nationalId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="member.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${memberInstance.constraints.gender.inList}" required="" value="${memberInstance?.gender}" 
			valueMessagePrefix="member.gender" default="none" noSelection="['':'--Select--']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'maritalStatus', 'error')} required">
	<label for="maritalStatus">
		<g:message code="member.maritalStatus.label" default="Marital Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="maritalStatus" from="${memberInstance.constraints.maritalStatus.inList}" required="" value="${memberInstance?.maritalStatus}" 
			valueMessagePrefix="member.maritalStatus" default="none" noSelection="['':'--Select--']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'familyRelationship', 'error')} required">
	<label for="familyRelationship">
		<g:message code="member.familyRelationship.label" default="Family Relationship" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="familyRelationship" from="${memberInstance.constraints.familyRelationship.inList}" required="" 
			value="${memberInstance?.familyRelationship}" valueMessagePrefix="member.familyRelationship" 
			default="none" noSelection="['':'--Select--']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="member.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" maxlength="40" value="${memberInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="member.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" maxlength="20" value="${memberInstance?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'cellphone', 'error')} ">
	<label for="cellphone">
		<g:message code="member.cellphone.label" default="Cellphone" />
		
	</label>
	<g:textField name="cellphone" maxlength="15" value="${memberInstance?.cellphone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'street', 'error')} ">
	<label for="street">
		<g:message code="member.street.label" default="Street" />
		
	</label>
	<g:textField name="street" maxlength="40" value="${memberInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'suburb', 'error')} ">
	<label for="suburb">
		<g:message code="member.suburb.label" default="Suburb" />
		
	</label>
	<g:textField name="suburb" maxlength="30" value="${memberInstance?.suburb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'employer', 'error')} ">
	<label for="employer">
		<g:message code="member.employer.label" default="Employer" />
		
	</label>
	<g:textField name="employer" maxlength="80" value="${memberInstance?.employer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'workTitle', 'error')} ">
	<label for="workTitle">
		<g:message code="member.workTitle.label" default="Work Title" />
		
	</label>
	<g:textField name="workTitle" maxlength="40" value="${memberInstance?.workTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'levelOfStudy', 'error')} ">
	<label for="levelOfStudy">
		<g:message code="member.levelOfStudy.label" default="Level Of Study" />
		
	</label>
	<g:select name="levelOfStudy" from="${memberInstance.constraints.levelOfStudy.inList}" required="" value="${memberInstance?.levelOfStudy}" 
			valueMessagePrefix="member.levelOfStudy" default="none" noSelection="['':'--Select--']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'studyDescription', 'error')} ">
	<label for="studyDescription">
		<g:message code="member.studyDescription.label" default="Description of Study" />
		
	</label>
	<g:textField name="studyDescription" maxlength="120" value="${memberInstance?.studyDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'sportInterests', 'error')} ">
	<label for="sportInterests">
		<g:message code="member.sportInterests.label" default="Sport Interests" />
		
	</label>
	<g:textField name="sportInterests" maxlength="80" value="${memberInstance?.sportInterests}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'departmets', 'error')} ">
	<label for="departmets">
		<g:message code="member.departmets.label" default="Departmets" />
		
	</label>
	<g:select name="departmets" from="${zw.co.bangsoft.bethel.model.Department.list()}" multiple="multiple" optionKey="id" size="5" value="${memberInstance?.departmets*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'positions', 'error')} ">
	<label for="positions">
		<g:message code="member.positions.label" default="Positions" />
		
	</label>
	<g:select name="positions" from="${zw.co.bangsoft.bethel.model.Position.list()}" multiple="multiple" optionKey="id" size="5" value="${memberInstance?.positions*.id}" class="many-to-many"/>
</div>

