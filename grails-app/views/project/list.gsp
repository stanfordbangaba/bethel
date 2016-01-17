
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
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-project" class="content scaffold-list" role="main">
			<h1>Search Projects</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="search">
				<g:formRemote name="searchForm" url="[action:'doSearch']" update="search-results">
					<div class="fieldcontain">
						<label for="name">Name</label>
						<g:textField name="name"/>
					</div>
					<div class="fieldcontain">
						<label for="description">Description</label>
						<g:textField name="description"/>
					</div>
					<div class="fieldcontain">
						<label for="dateOpened">Project Year</label>
						<g:datePicker name="dateOpened" precision="year" noSelection="['': '--Select--']" 
								default="none" relativeYears="${-10..0}" value="${new Date()}"/>
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
