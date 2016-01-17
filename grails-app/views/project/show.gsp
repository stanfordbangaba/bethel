
<%@ page import="zw.co.bangsoft.bethel.model.Project" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="receipts" id="${projectInstance?.id}">Show Receipts</g:link></li>
				<li><g:link class="list" action="pledges" id="${projectInstance?.id}">Show Pledges</g:link></li>
				<li><g:link class="list" action="summary" id="${projectInstance?.id}">Summary</g:link></li>
			</ul>
		</div>
		<div id="show-project" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list project">
			
				<g:if test="${projectInstance?.assembly}">
				<li class="fieldcontain">
					<span id="assembly-label" class="property-label"><g:message code="project.assembly.label" default="Assembly" /></span>
					
						<span class="property-value" aria-labelledby="assembly-label"><g:link controller="assembly" action="show" id="${projectInstance?.assembly?.id}">${projectInstance?.assembly?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="project.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${projectInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="project.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${projectInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.targetAmount}">
				<li class="fieldcontain">
					<span id="targetAmount-label" class="property-label"><g:message code="project.targetAmount.label" default="Target Amount" /></span>
					
						<span class="property-value" aria-labelledby="targetAmount-label"><g:fieldValue bean="${projectInstance}" field="targetAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.dateOpened}">
				<li class="fieldcontain">
					<span id="dateOpened-label" class="property-label"><g:message code="project.dateOpened.label" default="Date Opened" /></span>
					
						<span class="property-value" aria-labelledby="dateOpened-label"><g:formatDate date="${projectInstance?.dateOpened}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.dateClosed}">
				<li class="fieldcontain">
					<span id="dateClosed-label" class="property-label"><g:message code="project.dateClosed.label" default="Date Closed" /></span>
					
						<span class="property-value" aria-labelledby="dateClosed-label"><g:formatDate date="${projectInstance?.dateClosed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="project.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${projectInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="project.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${projectInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="project.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${projectInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
