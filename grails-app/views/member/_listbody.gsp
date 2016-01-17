<h1>Search Results</h1>
<div class="messages">
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
</div>		
<table>
	<thead>
		<tr>
										
			<g:sortableColumn property="lastName" title="${message(code: 'member.lastName.label', default: 'Last Name')}" />
										
			<g:sortableColumn property="firstName" title="${message(code: 'member.firstName.label', default: 'First Name')}" />
					
			<th><g:message code="member.family.label" default="Family" /></th>
					
			<g:sortableColumn property="dateOfBirth" title="${message(code: 'member.dateOfBirth.label', default: 'Date Of Birth')}" />
										
			<g:sortableColumn property="gender" title="${message(code: 'member.gender.label', default: 'Gender')}" />
					
		</tr>
	</thead>
	<tbody>
		<g:each in="${memberInstanceList}" status="i" var="memberInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
				<td><g:link controller="member" action="show" id="${memberInstance.id}">${fieldValue(bean: memberInstance, field: "lastName")}</g:link></td>
										
				<td>${fieldValue(bean: memberInstance, field: "firstName")}</td>
					
				<td>${fieldValue(bean: memberInstance, field: "family")}</td>
					
				<td><g:formatDate date="${memberInstance.dateOfBirth}" /></td>
										
				<td>${fieldValue(bean: memberInstance, field: "gender")}</td>
					
			</tr>
		</g:each>
	</tbody>
</table>
	
<div class="pagination">
	<g:if test="${memberInstanceTotal}">
		<g:paginate total="${memberInstanceTotal}" />
	</g:if>
</div>