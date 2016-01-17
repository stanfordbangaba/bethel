<%@ page import="zw.co.bangsoft.bethel.model.Project" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:javascript library="jquery"></g:javascript>
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="receipts" id="${projectInstance?.id}">Show Receipts</g:link></li>
				<li><g:link class="list" action="pledges" id="${projectInstance?.id}">Show Pledges</g:link></li>
			</ul>
		</div>
		<div id="list-project" class="content scaffold-list" role="main">
			<h1>Project Summary</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<ol class="property-list project">
				<g:if test="${projectInstance?.name}">
					<li class="fieldcontain">
						<span id="name-label" class="property-label"><g:message code="project.name.label" default="Name" /></span>
						
							<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${projectInstance}" field="name"/></span>
						
					</li>
				</g:if>
				
				<g:if test="${projectInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="project.description.label" default="Description" /></span>
						
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${projectInstance}" field="description"/></span>
						
				</li>
				</g:if>
				
				<g:if test="${projectInstance?.targetAmount}">
				<li class="fieldcontain">
					<span id="targetAmount-label" class="property-label"><g:message code="project.targetAmount.label" default="Target Amount" /></span>
					
						<span class="property-value" aria-labelledby="targetAmount-label"><g:fieldValue bean="${projectInstance}" field="targetAmount"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${cashReceiptsTotal}">
				<li class="fieldcontain">
					<span id="receipts-label" class="property-label">Cash Receipts</span>
					
						<span class="property-value" aria-labelledby="receipts-label">
							${cashReceiptsTotal}
						</span>
					
				</li>
				</g:if>
				
				<g:if test="${pledgeTotal}">
				<li class="fieldcontain">
					<span id="receipts-label" class="property-label">Total Pledges</span>
					
						<span class="property-value" aria-labelledby="receipts-label">
							${pledgeTotal}
						</span>
					
				</li>
				</g:if>
				
				<g:if test="${paidPledgesTotal}">
				<li class="fieldcontain">
					<span id="receipts-label" class="property-label">Paid Pledges</span>
					
						<span class="property-value" aria-labelledby="receipts-label">
							${paidPledgesTotal}
						</span>
					
				</li>
				</g:if>
				
				<g:if test="${pledgeTotal}">
				<li class="fieldcontain">
					<span id="receipts-label" class="property-label">Unpaid Pledges</span>
					
						<span class="property-value" aria-labelledby="receipts-label">
							${pledgeTotal - paidPledgesTotal}
						</span>
					
				</li>
				</g:if>
				
				<g:if test="${cashReceiptsTotal || paidPledgesTotal}">
				<li class="fieldcontain">
					<span id="receipts-label" class="property-label">Balance Without Unpaid Pledges</span>
					
						<span class="property-value" aria-labelledby="receipts-label">
							${cashReceiptsTotal + paidPledgesTotal - projectInstance?.targetAmount}
						</span>
					
				</li>
				</g:if>
				
				
				
				<g:if test="${pledgeTotal || cashReceiptsTotal}">
				<li class="fieldcontain">
					<span id="receipts-label" class="property-label">Balance With Pledges</span>
					
						<span class="property-value" aria-labelledby="receipts-label">
							${pledgeTotal + cashReceiptsTotal - projectInstance?.targetAmount}
						</span>
					
				</li>
				</g:if>
					
			</ol>
		</div>
	</body>
</html>
			