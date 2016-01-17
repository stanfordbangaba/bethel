<h1>Search Results</h1>
<div class="messages">
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
</div>		
<table>
	<thead>
		<tr>
										
			<g:sortableColumn property="name" title="${message(code: 'family.name.label', default: 'Name')}" />
						
			<th><g:message code="family.cellGroup.label" default="Cell Group" /></th>
					
			<g:sortableColumn property="landline" title="${message(code: 'family.landline.label', default: 'Landline')}" />
					
			<g:sortableColumn property="cellphone" title="${message(code: 'family.cellphone.label', default: 'Cellphone')}" />
					
			<g:sortableColumn property="street" title="${message(code: 'family.street.label', default: 'Street')}" />
					
			<g:sortableColumn property="suburb" title="${message(code: 'family.suburb.label', default: 'Suburb')}" />
					
		</tr>
	</thead>
	<tbody>
		<g:each in="${familyInstanceList}" status="i" var="familyInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
				<td><g:link action="show" id="${familyInstance.id}">${fieldValue(bean: familyInstance, field: "name")}</g:link></td>
					
				<td>${fieldValue(bean: familyInstance, field: "cellGroup")}</td>
					
				<td>${fieldValue(bean: familyInstance, field: "landline")}</td>
					
				<td>${fieldValue(bean: familyInstance, field: "cellphone")}</td>
					
				<td>${fieldValue(bean: familyInstance, field: "street")}</td>
					
				<td>${fieldValue(bean: familyInstance, field: "suburb")}</td>
					
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<g:if test="${familyInstanceTotal}">
		<g:paginate total="${familyInstanceTotal}" />
	</g:if>
</div>