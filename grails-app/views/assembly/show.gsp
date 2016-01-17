
<%@ page import="zw.co.bangsoft.bethel.model.Assembly" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assembly.label', default: 'Assembly')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-assembly" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-assembly" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list assembly">
			
				<g:if test="${assemblyInstance?.organisation}">
				<li class="fieldcontain">
					<span id="organisation-label" class="property-label"><g:message code="assembly.organisation.label" default="Organisation" /></span>
					
						<span class="property-value" aria-labelledby="organisation-label"><g:link controller="organisation" action="show" id="${assemblyInstance?.organisation?.id}">${assemblyInstance?.organisation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="assembly.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${assemblyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.pastorName}">
				<li class="fieldcontain">
					<span id="pastorName-label" class="property-label"><g:message code="assembly.pastorName.label" default="Pastor Name" /></span>
					
						<span class="property-value" aria-labelledby="pastorName-label"><g:fieldValue bean="${assemblyInstance}" field="pastorName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="assembly.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${assemblyInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.landline}">
				<li class="fieldcontain">
					<span id="landline-label" class="property-label"><g:message code="assembly.landline.label" default="Landline" /></span>
					
						<span class="property-value" aria-labelledby="landline-label"><g:fieldValue bean="${assemblyInstance}" field="landline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.cellphone}">
				<li class="fieldcontain">
					<span id="cellphone-label" class="property-label"><g:message code="assembly.cellphone.label" default="Cellphone" /></span>
					
						<span class="property-value" aria-labelledby="cellphone-label"><g:fieldValue bean="${assemblyInstance}" field="cellphone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="assembly.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${assemblyInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.suburb}">
				<li class="fieldcontain">
					<span id="suburb-label" class="property-label"><g:message code="assembly.suburb.label" default="Suburb" /></span>
					
						<span class="property-value" aria-labelledby="suburb-label"><g:fieldValue bean="${assemblyInstance}" field="suburb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="assembly.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${assemblyInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="assembly.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${assemblyInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assemblyInstance?.cellGroups}">
				<li class="fieldcontain">
					<span id="cellGroups-label" class="property-label"><g:message code="assembly.cellGroups.label" default="Cell Groups" /></span>
					
						<g:each in="${assemblyInstance.cellGroups}" var="c">
						<span class="property-value" aria-labelledby="cellGroups-label"><g:link controller="cellGroup" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				<li class="fieldcontain">
					<span class="property-value">
						<g:link controller="cellGroup" action="create" params="['assembly.id': assemblyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cellGroup.label', default: 'CellGroup')])}</g:link>
					</span>
				</li>
			
				<g:if test="${assemblyInstance?.departments}">
				<li class="fieldcontain">
					<span id="departments-label" class="property-label"><g:message code="assembly.departments.label" default="Departments" /></span>
					
						<g:each in="${assemblyInstance.departments}" var="d">
						<span class="property-value" aria-labelledby="departments-label"><g:link controller="department" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				<li class="fieldcontain">
					<span class="property-value">
						<g:link controller="department" action="create" params="['assembly.id': assemblyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'department.label', default: 'Department')])}</g:link>
					</span>
				</li>
				
				<g:if test="${assemblyInstance?.fellowshipGroups}">
				<li class="fieldcontain">
					<span id="fellowshipGroups-label" class="property-label"><g:message code="assembly.fellowshipGroups.label" default="Fellowship Groups" /></span>
					
						<g:each in="${assemblyInstance.fellowshipGroups}" var="f">
						<span class="property-value" aria-labelledby="fellowshipGroups-label"><g:link controller="fellowshipGroup" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				<li class="fieldcontain">
					<span class="property-value">
						<g:link controller="fellowshipGroup" action="create" params="['assembly.id': assemblyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'fellowshipGroup.label', default: 'FellowshipGroup')])}</g:link>
					</span>
				</li>
				
				<g:if test="${assemblyInstance?.projects}">
				<li class="fieldcontain">
					<span id="projects-label" class="property-label"><g:message code="assembly.projects.label" default="Projects" /></span>
					
						<g:each in="${assemblyInstance.projects}" var="p">
						<span class="property-value" aria-labelledby="projects-label"><g:link controller="project" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				<li class="fieldcontain">
					<span class="property-value">
						<g:link controller="project" action="create" params="['assembly.id': assemblyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'project.label', default: 'Project')])}</g:link>
					</span>
				</li>
				
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${assemblyInstance?.id}" />
					<g:link class="edit" action="edit" id="${assemblyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
