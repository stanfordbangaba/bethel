
<%@ page import="zw.co.bangsoft.bethel.model.Organisation" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organisation.label', default: 'Organisation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-organisation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-organisation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list organisation">
			
				<g:if test="${organisationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="organisation.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${organisationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="organisation.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${organisationInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.landline}">
				<li class="fieldcontain">
					<span id="landline-label" class="property-label"><g:message code="organisation.landline.label" default="Landline" /></span>
					
						<span class="property-value" aria-labelledby="landline-label"><g:fieldValue bean="${organisationInstance}" field="landline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.cellphone}">
				<li class="fieldcontain">
					<span id="cellphone-label" class="property-label"><g:message code="organisation.cellphone.label" default="Cellphone" /></span>
					
						<span class="property-value" aria-labelledby="cellphone-label"><g:fieldValue bean="${organisationInstance}" field="cellphone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="organisation.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${organisationInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.suburb}">
				<li class="fieldcontain">
					<span id="suburb-label" class="property-label"><g:message code="organisation.suburb.label" default="Suburb" /></span>
					
						<span class="property-value" aria-labelledby="suburb-label"><g:fieldValue bean="${organisationInstance}" field="suburb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="organisation.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${organisationInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="organisation.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${organisationInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="organisation.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${organisationInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="organisation.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${organisationInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.assemblies}">
				<li class="fieldcontain">
					<span id="assemblies-label" class="property-label"><g:message code="organisation.assemblies.label" default="Assemblies" /></span>
					
						<g:each in="${organisationInstance.assemblies}" var="a">
						<span class="property-value" aria-labelledby="assemblies-label"><g:link controller="assembly" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				
				<li class="fieldcontain">
					<span class="property-value">
						<g:link controller="assembly" action="create" params="['organisation.id': organisationInstance?.id]">Add Assembly</g:link>
					</span>
				</li>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${organisationInstance?.id}" />
					<g:link class="edit" action="edit" id="${organisationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
