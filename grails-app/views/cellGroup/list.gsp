
<%@ page import="zw.co.bangsoft.bethel.model.CellGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cellGroup.label', default: 'CellGroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cellGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="search">Search Members</g:link></li>
			</ul>
		</div>
		<div id="list-cellGroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
										
						<g:sortableColumn property="name" title="${message(code: 'cellGroup.name.label', default: 'Name')}" />
						
						<th><g:message code="cellGroup.assembly.label" default="Assembly" /></th>
					
						<g:sortableColumn property="leaderName" title="${message(code: 'cellGroup.leaderName.label', default: 'Leader Name')}" />
					
						<g:sortableColumn property="contactPhone" title="${message(code: 'cellGroup.contactPhone.label', default: 'Contact Phone')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'cellGroup.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'cellGroup.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cellGroupInstanceList}" status="i" var="cellGroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cellGroupInstance.id}">${fieldValue(bean: cellGroupInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: cellGroupInstance, field: "assembly")}</td>
					
						<td>${fieldValue(bean: cellGroupInstance, field: "leaderName")}</td>
					
						<td>${fieldValue(bean: cellGroupInstance, field: "contactPhone")}</td>
					
						<td>${fieldValue(bean: cellGroupInstance, field: "description")}</td>
					
						<td><g:formatDate date="${cellGroupInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cellGroupInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
