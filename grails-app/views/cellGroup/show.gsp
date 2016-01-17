
<%@ page import="zw.co.bangsoft.bethel.model.CellGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cellGroup.label', default: 'CellGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cellGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cellGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cellGroup">
			
				<g:if test="${cellGroupInstance?.assembly}">
				<li class="fieldcontain">
					<span id="assembly-label" class="property-label"><g:message code="cellGroup.assembly.label" default="Assembly" /></span>
					
						<span class="property-value" aria-labelledby="assembly-label"><g:link controller="assembly" action="show" id="${cellGroupInstance?.assembly?.id}">${cellGroupInstance?.assembly?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cellGroupInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="cellGroup.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${cellGroupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cellGroupInstance?.leaderName}">
				<li class="fieldcontain">
					<span id="leaderName-label" class="property-label"><g:message code="cellGroup.leaderName.label" default="Leader Name" /></span>
					
						<span class="property-value" aria-labelledby="leaderName-label"><g:fieldValue bean="${cellGroupInstance}" field="leaderName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cellGroupInstance?.contactPhone}">
				<li class="fieldcontain">
					<span id="contactPhone-label" class="property-label"><g:message code="cellGroup.contactPhone.label" default="Contact Phone" /></span>
					
						<span class="property-value" aria-labelledby="contactPhone-label"><g:fieldValue bean="${cellGroupInstance}" field="contactPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cellGroupInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="cellGroup.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${cellGroupInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cellGroupInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="cellGroup.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${cellGroupInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cellGroupInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="cellGroup.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${cellGroupInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${cellGroupInstance?.families}">
				<li class="fieldcontain">
					<span id="families-label" class="property-label"><g:message code="cellGroup.families.label" default="Families" /></span>
					
						<g:each in="${cellGroupInstance.families}" var="f">
						<span class="property-value" aria-labelledby="families-label"><g:link controller="family" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				<li class="fieldcontain">
					<span class="property-value">
						<g:link controller="family" action="create" params="['cellGroup.id': cellGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'family.label', default: 'Family')])}</g:link>
					</span>
				</li>
				
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cellGroupInstance?.id}" />
					<g:link class="edit" action="edit" id="${cellGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
