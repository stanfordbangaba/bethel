
<%@ page import="zw.co.bangsoft.bethel.model.Department" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-department" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-department" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
										
						<g:sortableColumn property="name" title="${message(code: 'department.name.label', default: 'Name')}" />
					
						<th><g:message code="department.assembly.label" default="Assembly" /></th>
					
						<g:sortableColumn property="leaderName" title="${message(code: 'department.leaderName.label', default: 'Leader Name')}" />
					
						<g:sortableColumn property="contactPhone" title="${message(code: 'department.contactPhone.label', default: 'Contact Phone')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'department.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'department.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${departmentInstanceList}" status="i" var="departmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${departmentInstance.id}">${fieldValue(bean: departmentInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: departmentInstance, field: "assembly")}</td>
					
						<td>${fieldValue(bean: departmentInstance, field: "leaderName")}</td>
					
						<td>${fieldValue(bean: departmentInstance, field: "contactPhone")}</td>
					
						<td>${fieldValue(bean: departmentInstance, field: "description")}</td>
					
						<td><g:formatDate date="${departmentInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${departmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
