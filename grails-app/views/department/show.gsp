
<%@ page import="zw.co.bangsoft.bethel.model.Department" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-department" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-department" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list department">
			
				<g:if test="${departmentInstance?.assembly}">
				<li class="fieldcontain">
					<span id="assembly-label" class="property-label"><g:message code="department.assembly.label" default="Assembly" /></span>
					
						<span class="property-value" aria-labelledby="assembly-label"><g:link controller="assembly" action="show" id="${departmentInstance?.assembly?.id}">${departmentInstance?.assembly?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="department.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${departmentInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentInstance?.leaderName}">
				<li class="fieldcontain">
					<span id="leaderName-label" class="property-label"><g:message code="department.leaderName.label" default="Leader Name" /></span>
					
						<span class="property-value" aria-labelledby="leaderName-label"><g:fieldValue bean="${departmentInstance}" field="leaderName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentInstance?.contactPhone}">
				<li class="fieldcontain">
					<span id="contactPhone-label" class="property-label"><g:message code="department.contactPhone.label" default="Contact Phone" /></span>
					
						<span class="property-value" aria-labelledby="contactPhone-label"><g:fieldValue bean="${departmentInstance}" field="contactPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="department.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${departmentInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="department.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${departmentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="department.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${departmentInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentInstance?.members}">
				<li class="fieldcontain">
					<span id="members-label" class="property-label"><g:message code="department.members.label" default="Members" /></span>
					
						<g:each in="${departmentInstance.members}" var="m">
						<span class="property-value" aria-labelledby="members-label"><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
					
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${departmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${departmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
