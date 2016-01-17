
<%@ page import="zw.co.bangsoft.bethel.model.Pledge" %>
<%@ page import="zw.co.bangsoft.bethel.model.Member" %>
<%@ page import="zw.co.bangsoft.bethel.model.Project" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:javascript library="jquery"></g:javascript>
		<g:set var="entityName" value="${message(code: 'pledge.label', default: 'Pledge')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pledge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pledge" class="content scaffold-list" role="main">
			<h1>Search Pledges</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="search">
				<g:formRemote name="searchForm" url="[action:'doSearch']" update="search-results">
					<div class="fieldcontain">
						<label for="project.id">Project</label>
						<g:select name="project.id" from="${Project.list()}" optionKey="id" noSelection="['': '--Select--']"/>
					</div>
					<div class="fieldcontain">
						<label for="member.id">Member</label>
						<g:select name="member.id" from="${Member.list()}" optionKey="id" noSelection="['': '--Select--']"/>
					</div>
					<div class="fieldcontain">
						<label for="valueDate">Value Date</label>
						<g:datePicker name="valueDate" precision="day" noSelection="['': '--Select--']" default="none" relativeYears="${-10..1}"/>
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
