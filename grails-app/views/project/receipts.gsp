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
				<li><g:link class="list" action="pledges" id="${projectInstance?.id}">Show Pledges</g:link></li>
				<li><g:link class="list" action="summary" id="${projectInstance?.id}">Summary</g:link></li>
			</ul>
		</div>
		<div id="list-project" class="content scaffold-list" role="main">
			<h1>Project Details</h1>
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
					
					<g:if test="${receiptInstanceList}">
					<li class="fieldcontain">
						<span id="receipts-label" class="property-label">Total Receipts</span>
						
							<span class="property-value" aria-labelledby="receipts-label">
								<bang:total collection="${receiptInstanceList}" var="amount"/>
							</span>
						
					</li>
					</g:if>
					
					<g:if test="${receiptInstanceList}">
					<li class="fieldcontain">
						<span id="receipts-label" class="property-label">Balance</span>
						
							<span class="property-value" aria-labelledby="receipts-label">
								<bang:balance collection="${receiptInstanceList}" var="amount" targetAmount="${projectInstance?.targetAmount}"/>
							</span>
						
					</li>
					</g:if>
					
				</ol>
			<div id="search-results">
				<g:render template="/receipt/listbody"></g:render>
			</div>
		</div>
	</body>
</html>
			