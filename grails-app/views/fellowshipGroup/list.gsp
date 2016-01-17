
<%@ page import="zw.co.bangsoft.bethel.model.FellowshipGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fellowshipGroup.label', default: 'FellowshipGroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fellowshipGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="search">Search Members</g:link></li>
			</ul>
		</div>
		<div id="list-fellowshipGroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
										
						<g:sortableColumn property="name" title="${message(code: 'fellowshipGroup.name.label', default: 'Name')}" />
					
						<th><g:message code="fellowshipGroup.assembly.label" default="Assembly" /></th>
					
						<g:sortableColumn property="leaderName" title="${message(code: 'fellowshipGroup.leaderName.label', default: 'Leader Name')}" />
					
						<g:sortableColumn property="contactPhone" title="${message(code: 'fellowshipGroup.contactPhone.label', default: 'Contact Phone')}" />
					
						<g:sortableColumn property="descrition" title="${message(code: 'fellowshipGroup.descrition.label', default: 'Descrition')}" />
					
						<th><g:message code="fellowshipGroup.ageGroup.label" default="Age Group" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fellowshipGroupInstanceList}" status="i" var="fellowshipGroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fellowshipGroupInstance.id}">${fieldValue(bean: fellowshipGroupInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: fellowshipGroupInstance, field: "assembly")}</td>
					
						<td>${fieldValue(bean: fellowshipGroupInstance, field: "leaderName")}</td>
					
						<td>${fieldValue(bean: fellowshipGroupInstance, field: "contactPhone")}</td>
					
						<td>${fieldValue(bean: fellowshipGroupInstance, field: "descrition")}</td>
					
						<td>${fieldValue(bean: fellowshipGroupInstance, field: "ageGroup")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fellowshipGroupInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
