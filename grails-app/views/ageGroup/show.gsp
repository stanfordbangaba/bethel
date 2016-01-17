
<%@ page import="zw.co.bangsoft.bethel.model.AgeGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ageGroup.label', default: 'AgeGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ageGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ageGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ageGroup">
			
				<g:if test="${ageGroupInstance?.organisation}">
				<li class="fieldcontain">
					<span id="organisation-label" class="property-label"><g:message code="ageGroup.organisation.label" default="Organisation" /></span>
					
						<span class="property-value" aria-labelledby="organisation-label"><g:link controller="organisation" action="show" id="${ageGroupInstance?.organisation?.id}">${ageGroupInstance?.organisation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ageGroupInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="ageGroup.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${ageGroupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ageGroupInstance?.minimumAge}">
				<li class="fieldcontain">
					<span id="minimumAge-label" class="property-label"><g:message code="ageGroup.minimumAge.label" default="Minimum Age" /></span>
					
						<span class="property-value" aria-labelledby="minimumAge-label"><g:fieldValue bean="${ageGroupInstance}" field="minimumAge"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ageGroupInstance?.maximumAge}">
				<li class="fieldcontain">
					<span id="maximumAge-label" class="property-label"><g:message code="ageGroup.maximumAge.label" default="Maximum Age" /></span>
					
						<span class="property-value" aria-labelledby="maximumAge-label"><g:fieldValue bean="${ageGroupInstance}" field="maximumAge"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ageGroupInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="ageGroup.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ageGroupInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ageGroupInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="ageGroup.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${ageGroupInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ageGroupInstance?.id}" />
					<g:link class="edit" action="edit" id="${ageGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
