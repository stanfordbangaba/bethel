<h1>Search Results</h1>
<g:if test="${flash.message}">
	<div class="message" role="status">${flash.message}</div>
</g:if>
<table>
	<thead>
		<tr>
					
			<g:sortableColumn property="dateCreated" title="${message(code: 'pledge.dateCreated.label', default: 'Date')}" />
					
			<th><g:message code="pledge.project.label" default="Project" /></th>
					
			<th><g:message code="pledge.member.label" default="Member" /></th>
					
			<g:sortableColumn property="amount" title="${message(code: 'pledge.amount.label', default: 'Amount')}" />
					
			<g:sortableColumn property="valueDate" title="${message(code: 'pledge.valueDate.label', default: 'Value Date')}" />
					
			<g:sortableColumn property="lastUpdated" title="${message(code: 'pledge.lastUpdated.label', default: 'Last Updated')}" />
					
		</tr>
	</thead>
	<tbody>
		<g:each in="${pledgeInstanceList}" status="i" var="pledgeInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
				<td><g:link action="show" id="${pledgeInstance.id}"><g:formatDate date="${pledgeInstance?.dateCreated}" format="dd/MM/yyyy"/></g:link></td>
					
				<td>${fieldValue(bean: pledgeInstance, field: "project")}</td>
					
				<td>${fieldValue(bean: pledgeInstance, field: "member")}</td>
					
				<td>${fieldValue(bean: pledgeInstance, field: "amount")}</td>
					
				<td><g:formatDate date="${pledgeInstance.valueDate}" format="dd/MM/yyyy"/></td>
					
				<td><g:formatDate date="${pledgeInstance.lastUpdated}" /></td>
					
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<g:if test="${pledgeInstanceTotal}">
		<g:paginate total="${pledgeInstanceTotal}" />
	</g:if>
</div>