<h1>Search Results</h1>
<g:if test="${flash.message}">
	<div class="message" role="status">${flash.message}</div>
</g:if>
<table>
	<thead>
		<tr>
				
			<g:sortableColumn property="receiptNo" title="${message(code: 'receipt.receiptNo.label', default: 'Receipt No')}" />
			
			<g:sortableColumn property="entityName" title="${message(code: 'receipt.entityName.label', default: 'Owner')}" />
			
			<g:sortableColumn property="amount" title="${message(code: 'receipt.amount.label', default: 'Amount')}" />
				
			<g:sortableColumn property="type" title="${message(code: 'receipt.type.label', default: 'Type')}" />
							
			<g:sortableColumn property="dateCreated" title="${message(code: 'receipt.dateCreated.label', default: 'Payment Date')}" />
																
			<g:sortableColumn property="valueDate" title="${message(code: 'receipt.valueDate.label', default: 'Value Date')}" />
			
				
		</tr>
	</thead>
	<tbody>
		<g:each in="${receiptInstanceList}" status="i" var="receiptInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
				<td><g:link action="show" id="${receiptInstance.id}">${fieldValue(bean: receiptInstance, field: "receiptNo")}</g:link></td>
								
				<td><bang:receiptOwner entityName="${receiptInstance.entityName}" entityId="${receiptInstance.entityId}"/></td>
				
				<td>${fieldValue(bean: receiptInstance, field: "amount")}</td>
				
				<td>${fieldValue(bean: receiptInstance, field: "type")}</td>
								
				<td>${fieldValue(bean: receiptInstance, field: "dateCreated")}</td>
								
				<td><g:formatDate date="${receiptInstance.valueDate}" /></td>
				
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
<g:if test="${receiptInstanceTotal}">
	<g:paginate total="${receiptInstanceTotal}" />
</g:if>
</div>
