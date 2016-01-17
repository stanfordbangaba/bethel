
<%@ page import="zw.co.bangsoft.bethel.model.Member" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-member" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-member" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list member">
			
				<g:if test="${memberInstance?.family}">
				<li class="fieldcontain">
					<span id="family-label" class="property-label"><g:message code="member.family.label" default="Family" /></span>
					
						<span class="property-value" aria-labelledby="family-label"><g:link controller="family" action="show" id="${memberInstance?.family?.id}">${memberInstance?.family?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="member.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${memberInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="member.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${memberInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="member.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label">
							<g:formatDate date="${memberInstance?.dateOfBirth}" format="dd/MM/yyyy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.nationalId}">
				<li class="fieldcontain">
					<span id="nationalId-label" class="property-label"><g:message code="member.nationalId.label" default="National Id" /></span>
					
						<span class="property-value" aria-labelledby="nationalId-label"><g:fieldValue bean="${memberInstance}" field="nationalId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="member.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${memberInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.maritalStatus}">
				<li class="fieldcontain">
					<span id="maritalStatus-label" class="property-label"><g:message code="member.maritalStatus.label" default="Marital Status" /></span>
					
						<span class="property-value" aria-labelledby="maritalStatus-label"><g:fieldValue bean="${memberInstance}" field="maritalStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.familyRelationship}">
				<li class="fieldcontain">
					<span id="familyRelationship-label" class="property-label"><g:message code="member.familyRelationship.label" default="Family Relationship" /></span>
					
						<span class="property-value" aria-labelledby="familyRelationship-label"><g:fieldValue bean="${memberInstance}" field="familyRelationship"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="member.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${memberInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.landline}">
				<li class="fieldcontain">
					<span id="landline-label" class="property-label"><g:message code="member.landline.label" default="Landline" /></span>
					
						<span class="property-value" aria-labelledby="landline-label"><g:fieldValue bean="${memberInstance}" field="landline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.cellphone}">
				<li class="fieldcontain">
					<span id="cellphone-label" class="property-label"><g:message code="member.cellphone.label" default="Cellphone" /></span>
					
						<span class="property-value" aria-labelledby="cellphone-label"><g:fieldValue bean="${memberInstance}" field="cellphone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="member.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${memberInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.suburb}">
				<li class="fieldcontain">
					<span id="suburb-label" class="property-label"><g:message code="member.suburb.label" default="Suburb" /></span>
					
						<span class="property-value" aria-labelledby="suburb-label"><g:fieldValue bean="${memberInstance}" field="suburb"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${memberInstance?.employer}">
				<li class="fieldcontain">
					<span id="employer-label" class="property-label"><g:message code="member.employer.label" default="Employer" /></span>
					
						<span class="property-value" aria-labelledby="employer-label"><g:fieldValue bean="${memberInstance}" field="employer"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${memberInstance?.workTitle}">
				<li class="fieldcontain">
					<span id="workTitle-label" class="property-label"><g:message code="member.workTitle.label" default="Work Title" /></span>
					
						<span class="property-value" aria-labelledby="workTitle-label"><g:fieldValue bean="${memberInstance}" field="workTitle"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${memberInstance?.levelOfStudy}">
				<li class="fieldcontain">
					<span id="levelOfStudy-label" class="property-label"><g:message code="member.levelOfStudy.label" default="Level Of Study" /></span>
					
						<span class="property-value" aria-labelledby="levelOfStudy-label"><g:fieldValue bean="${memberInstance}" field="levelOfStudy"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${memberInstance?.studyDescription}">
				<li class="fieldcontain">
					<span id="studyDescription-label" class="property-label"><g:message code="member.studyDescription.label" default="Description of Study" /></span>
					
						<span class="property-value" aria-labelledby="studyDescription-label"><g:fieldValue bean="${memberInstance}" field="studyDescription"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${memberInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="member.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${memberInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="member.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${memberInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.departmets}">
				<li class="fieldcontain">
					<span id="departmets-label" class="property-label"><g:message code="member.departmets.label" default="Departmets" /></span>
					
						<g:each in="${memberInstance.departmets}" var="d">
						<span class="property-value" aria-labelledby="departmets-label"><g:link controller="department" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				
				<g:if test="${memberInstance?.fellowshipGroups}">
				<li class="fieldcontain">
					<span id="fellowshipGroups-label" class="property-label"><g:message code="member.fellowshipGroups.label" default="Fellowship Groups" /></span>
					
						<g:each in="${memberInstance.fellowshipGroups}" var="f">
						<span class="property-value" aria-labelledby="fellowshipGroups-label"><g:link controller="fellowshipGroup" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.pledges}">
				<li class="fieldcontain">
					<span id="pledges-label" class="property-label"><g:message code="member.pledges.label" default="Pledges" /></span>
					
						<g:each in="${memberInstance.pledges}" var="p">
						<span class="property-value" aria-labelledby="pledges-label"><g:link controller="pledge" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${memberInstance?.positions}">
				<li class="fieldcontain">
					<span id="positions-label" class="property-label"><g:message code="member.positions.label" default="Positions" /></span>
					
						<g:each in="${memberInstance.positions}" var="p">
						<span class="property-value" aria-labelledby="positions-label"><g:link controller="position" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${memberInstance?.id}" />
					<g:link class="edit" action="edit" id="${memberInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
