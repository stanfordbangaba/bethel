
<%@ page import="zw.co.bangsoft.bethel.model.FellowshipGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fellowshipGroup.label', default: 'FellowshipGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fellowshipGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fellowshipGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fellowshipGroup">
			
				<g:if test="${fellowshipGroupInstance?.assembly}">
				<li class="fieldcontain">
					<span id="assembly-label" class="property-label"><g:message code="fellowshipGroup.assembly.label" default="Assembly" /></span>
					
						<span class="property-value" aria-labelledby="assembly-label"><g:link controller="assembly" action="show" id="${fellowshipGroupInstance?.assembly?.id}">${fellowshipGroupInstance?.assembly?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${fellowshipGroupInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="fellowshipGroup.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${fellowshipGroupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fellowshipGroupInstance?.leaderName}">
				<li class="fieldcontain">
					<span id="leaderName-label" class="property-label"><g:message code="fellowshipGroup.leaderName.label" default="Leader Name" /></span>
					
						<span class="property-value" aria-labelledby="leaderName-label"><g:fieldValue bean="${fellowshipGroupInstance}" field="leaderName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fellowshipGroupInstance?.contactPhone}">
				<li class="fieldcontain">
					<span id="contactPhone-label" class="property-label"><g:message code="fellowshipGroup.contactPhone.label" default="Contact Phone" /></span>
					
						<span class="property-value" aria-labelledby="contactPhone-label"><g:fieldValue bean="${fellowshipGroupInstance}" field="contactPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fellowshipGroupInstance?.descrition}">
				<li class="fieldcontain">
					<span id="descrition-label" class="property-label"><g:message code="fellowshipGroup.descrition.label" default="Descrition" /></span>
					
						<span class="property-value" aria-labelledby="descrition-label"><g:fieldValue bean="${fellowshipGroupInstance}" field="descrition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fellowshipGroupInstance?.ageGroup}">
				<li class="fieldcontain">
					<span id="ageGroup-label" class="property-label"><g:message code="fellowshipGroup.ageGroup.label" default="Age Group" /></span>
					
						<span class="property-value" aria-labelledby="ageGroup-label"><g:link controller="ageGroup" action="show" id="${fellowshipGroupInstance?.ageGroup?.id}">${fellowshipGroupInstance?.ageGroup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${fellowshipGroupInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="fellowshipGroup.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${fellowshipGroupInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fellowshipGroupInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="fellowshipGroup.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${fellowshipGroupInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fellowshipGroupInstance?.members}">
				<li class="fieldcontain">
					<span id="members-label" class="property-label"><g:message code="fellowshipGroup.members.label" default="Members" /></span>
					
						<g:each in="${fellowshipGroupInstance.members}" var="m">
						<span class="property-value" aria-labelledby="members-label"><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
	
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${fellowshipGroupInstance?.id}" />
					<g:link class="edit" action="edit" id="${fellowshipGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
