
<%@ page import="zw.co.bangsoft.bethel.model.Receipt" %>
<%@ page import="zw.co.bangsoft.bethel.model.Project" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receipt.label', default: 'Receipt')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-receipt" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-receipt" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list receipt">
			
				<g:if test="${receiptInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="receipt.dateCreated.label" default="Payment Date"/></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${receiptInstance?.dateCreated}" format="dd/MM/yyyy"/></span>
					
				</li>
				</g:if>
		
				<g:if test="${receiptInstance?.receiptNo}">
				<li class="fieldcontain">
					<span id="receiptNo-label" class="property-label"><g:message code="receipt.receiptNo.label" default="Receipt No" /></span>
					
						<span class="property-value" aria-labelledby="receiptNo-label"><g:fieldValue bean="${receiptInstance}" field="receiptNo"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${receiptInstance?.entityName}">
				<li class="fieldcontain">
					<span id="entityName-label" class="property-label"><g:message code="receipt.entityName.label" default="Owner Name" /></span>
					
						<span class="property-value" aria-labelledby="entityName-label">
							<bang:receiptOwner entityName="${receiptInstance.entityName}" entityId="${receiptInstance.entityId}"/> 
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${receiptInstance?.projectId}">
				<li class="fieldcontain">
					<span id="projectId-label" class="property-label"><g:message code="receipt.projectId.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="projectId-label">${Project.get(receiptInstance.projectId)}</span>
					
				</li>
				</g:if>
				
				<g:if test="${receiptInstance?.narrative}">
				<li class="fieldcontain">
					<span id="narrative-label" class="property-label"><g:message code="receipt.narrative.label" default="Narrative" /></span>
					
						<span class="property-value" aria-labelledby="narrative-label"><g:fieldValue bean="${receiptInstance}" field="narrative"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${receiptInstance?.valueDate}">
				<li class="fieldcontain">
					<span id="valueDate-label" class="property-label"><g:message code="receipt.valueDate.label" default="Value Date" /></span>
					
						<span class="property-value" aria-labelledby="valueDate-label"><g:formatDate date="${receiptInstance?.valueDate}" format="dd/MM/yyyy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${receiptInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="receipt.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${receiptInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${receiptInstance?.otherType}">
				<li class="fieldcontain">
					<span id="otherType-label" class="property-label"><g:message code="receipt.otherType.label" default="Other Type" /></span>
					
						<span class="property-value" aria-labelledby="otherType-label"><g:fieldValue bean="${receiptInstance}" field="otherType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${receiptInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="receipt.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${receiptInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${receiptInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="receipt.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${receiptInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${receiptInstance?.id}" />
					<g:link class="edit" action="edit" id="${receiptInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
