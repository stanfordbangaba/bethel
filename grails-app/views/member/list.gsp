<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="zw.co.bangsoft.bethel.model.Member" %>
<%@ page import="zw.co.bangsoft.bethel.model.Family" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<g:javascript library="jquery"></g:javascript>
<title>Search Members</title>
</head>
<body>
  <div class="body">
  	<a href="#list-member" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">New Member</g:link></li>
				<li><g:link class="list" action="report">Member Reports</g:link></li>
			</ul>
		</div>
		
		<div id="list-member" class="content scaffold-create" role="main">
		
		<h1>Search Member</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>

		<div class="search">
			<g:formRemote name="searchForm" url="[action:'search']" update="search-results">
				<g:render template="search"></g:render>
				<fieldset class="buttons">
					<g:actionSubmit value="Submit Query" class="edit" action="search"/>
				</fieldset>
			</g:formRemote>
		</div>
		<div id="search-results">
			<g:render template="listbody"></g:render>
		</div>		
	</div>
  </div>
</body>
</html>