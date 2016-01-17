
<%@ page import="zw.co.bangsoft.bethel.model.AgeGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ageGroup.label', default: 'AgeGroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ageGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="search">Search Members</g:link></li>
			</ul>
		</div>
		<div id="list-ageGroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'ageGroup.name.label', default: 'Name')}" />
					
						<th><g:message code="ageGroup.organisation.label" default="Organisation" /></th>
										
						<g:sortableColumn property="minimumAge" title="${message(code: 'ageGroup.minimumAge.label', default: 'Minimum Age')}" />
					
						<g:sortableColumn property="maximumAge" title="${message(code: 'ageGroup.maximumAge.label', default: 'Maximum Age')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'ageGroup.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'ageGroup.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ageGroupInstanceList}" status="i" var="ageGroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ageGroupInstance.id}">${fieldValue(bean: ageGroupInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: ageGroupInstance, field: "organisation")}</td>
					
						<td>${fieldValue(bean: ageGroupInstance, field: "minimumAge")}</td>
					
						<td>${fieldValue(bean: ageGroupInstance, field: "maximumAge")}</td>
					
						<td><g:formatDate date="${ageGroupInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${ageGroupInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ageGroupInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
