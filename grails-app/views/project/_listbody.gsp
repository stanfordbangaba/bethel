<h1>Search Results</h1>
<g:if test="${flash.message}">
	<div class="message" role="status">${flash.message}</div>
</g:if>
<table>
	<thead>
		<tr>
										
			<g:sortableColumn property="name" title="${message(code: 'project.name.label', default: 'Name')}" />
					
			<th><g:message code="project.assembly.label" default="Assembly" /></th>
					
			<g:sortableColumn property="description" title="${message(code: 'project.description.label', default: 'Description')}" />
					
			<g:sortableColumn property="targetAmount" title="${message(code: 'project.targetAmount.label', default: 'Target Amount')}" />
					
			<g:sortableColumn property="dateOpened" title="${message(code: 'project.dateOpened.label', default: 'Date Opened')}" />
					
			<g:sortableColumn property="dateClosed" title="${message(code: 'project.dateClosed.label', default: 'Date Closed')}" />
					
		</tr>
	</thead>
	<tbody>
		<g:each in="${projectInstanceList}" status="i" var="projectInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
				<td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean: projectInstance, field: "name")}</g:link></td>
					
				<td>${fieldValue(bean: projectInstance, field: "assembly")}</td>
					
				<td>${fieldValue(bean: projectInstance, field: "description")}</td>
					
				<td>${fieldValue(bean: projectInstance, field: "targetAmount")}</td>
					
				<td><g:formatDate date="${projectInstance.dateOpened}" /></td>
					
				<td><g:formatDate date="${projectInstance.dateClosed}" /></td>
					
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<g:if test="${projectInstanceTotal}">
		<g:paginate total="${projectInstanceTotal}" />
	</g:if>
</div>