
<%@ page import="zw.co.bangsoft.bethel.model.Assembly" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assembly.label', default: 'Assembly')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-assembly" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-assembly" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
										
						<g:sortableColumn property="name" title="${message(code: 'assembly.name.label', default: 'Name')}" />
					
						<th><g:message code="assembly.organisation.label" default="Organisation" /></th>
					
						<g:sortableColumn property="pastorName" title="${message(code: 'assembly.pastorName.label', default: 'Pastor Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'assembly.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="landline" title="${message(code: 'assembly.landline.label', default: 'Landline')}" />
					
						<g:sortableColumn property="cellphone" title="${message(code: 'assembly.cellphone.label', default: 'Cellphone')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${assemblyInstanceList}" status="i" var="assemblyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${assemblyInstance.id}">${fieldValue(bean: assemblyInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: assemblyInstance, field: "organisation")}</td>
					
						<td>${fieldValue(bean: assemblyInstance, field: "pastorName")}</td>
					
						<td>${fieldValue(bean: assemblyInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: assemblyInstance, field: "landline")}</td>
					
						<td>${fieldValue(bean: assemblyInstance, field: "cellphone")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${assemblyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
