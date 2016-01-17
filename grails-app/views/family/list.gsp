
<%@ page import="zw.co.bangsoft.bethel.model.Family" %>
<%@ page import="zw.co.bangsoft.bethel.model.CellGroup" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:javascript library="jquery"></g:javascript>
		<g:set var="entityName" value="${message(code: 'family.label', default: 'Family')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-family" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-family" class="content scaffold-list" role="main">
			<h1>Search Family</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
		
			<div class="search">
				<g:formRemote name="searchForm" url="[action:'search']" update="search-results">
					<div class="fieldcontain">
						<label for="cellGroup.id">Cell Group</label>
						<g:select name="cellGroup.id" from="${CellGroup.list()}" optionKey="id" noSelection="['': '--Select--']"/>
					</div>
					<div class="fieldcontain">
						<label for="name">Name</label>
						<g:textField name="name"/>
					</div>
					<div class="fieldcontain">
						<label for="street">Street</label>
						<g:textField name="street" />
					</div>
					<div class="fieldcontain">
						<label for="suburb">Suburb</label>
						<g:textField name="suburb" />
					</div>
					<br/>
					<fieldset class="buttons">
						<g:submitButton name="Submit Query" class="edit"/>
					</fieldset>
				</g:formRemote>
			</div>
			<div id="search-results">
				<g:render template="listbody"></g:render>
			</div>
		</div>
	</body>
</html>
