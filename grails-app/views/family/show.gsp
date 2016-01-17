
<%@ page import="zw.co.bangsoft.bethel.model.Family" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'family.label', default: 'Family')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-family" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-family" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list family">
			
				<g:if test="${familyInstance?.cellGroup}">
				<li class="fieldcontain">
					<span id="cellGroup-label" class="property-label"><g:message code="family.cellGroup.label" default="Cell Group" /></span>
					
						<span class="property-value" aria-labelledby="cellGroup-label"><g:link controller="cellGroup" action="show" id="${familyInstance?.cellGroup?.id}">${familyInstance?.cellGroup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="family.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${familyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.landline}">
				<li class="fieldcontain">
					<span id="landline-label" class="property-label"><g:message code="family.landline.label" default="Landline" /></span>
					
						<span class="property-value" aria-labelledby="landline-label"><g:fieldValue bean="${familyInstance}" field="landline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.cellphone}">
				<li class="fieldcontain">
					<span id="cellphone-label" class="property-label"><g:message code="family.cellphone.label" default="Cellphone" /></span>
					
						<span class="property-value" aria-labelledby="cellphone-label"><g:fieldValue bean="${familyInstance}" field="cellphone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="family.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${familyInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.suburb}">
				<li class="fieldcontain">
					<span id="suburb-label" class="property-label"><g:message code="family.suburb.label" default="Suburb" /></span>
					
						<span class="property-value" aria-labelledby="suburb-label"><g:fieldValue bean="${familyInstance}" field="suburb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="family.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${familyInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="family.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${familyInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.members}">
				<li class="fieldcontain">
					<span id="members-label" class="property-label"><g:message code="family.members.label" default="Members" /></span>
					
						<g:each in="${familyInstance.members}" var="m">
						<span class="property-value" aria-labelledby="members-label"><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				<li class="fieldcontain">
					<span class="property-value">
						<g:link controller="member" action="create" params="['family.id': familyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'member.label', default: 'Member')])}</g:link>
					</span>
				</li>
				
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${familyInstance?.id}" />
					<g:link class="edit" action="edit" id="${familyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
