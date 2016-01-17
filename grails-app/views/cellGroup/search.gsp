<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="zw.co.bangsoft.bethel.model.CellGroup" %>

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
				<li><g:link class="create" action="create">New CellGroup</g:link></li>
			</ul>
		</div>
		
		<div id="list-member" class="content scaffold-create" role="main">
		
		<h1>Search CellGroup Members</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>

		<div class="search">
			<g:formRemote name="searchForm" url="[action:'doSearch']" update="search-results">
				<div class="fieldcontain">
					<label for="cellGroup.id">Cell Group</label>
					<g:select name="cellGroup.id" from="${CellGroup.list()}" optionKey="id" noSelection="['': '--Select--']"/>
				</div>
				<br/>
				<fieldset class="buttons">
					<g:submitButton name="Submit Query" class="edit"/>
				</fieldset>
			</g:formRemote>
		</div>
		<div id="search-results">
			<g:render template="../member/listbody"></g:render>
		</div>		
	</div>
  </div>
  </div>
</body>
</html>