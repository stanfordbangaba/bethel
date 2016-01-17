<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="zw.co.bangsoft.bethel.model.AgeGroup" %>

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
				<li><g:link class="create" action="create">New AgeGroup</g:link></li>
			</ul>
		</div>
		
		<div id="list-member" class="content scaffold-create" role="main">
		
		<h1>Search AgeGroup Members</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>

		<div class="search">
			<g:formRemote name="searchForm" url="[action:'doSearch']" update="search-results">
				<div class="fieldcontain">
					<label for="ageGroup.id">Age Group</label>
					<g:select name="ageGroup.id" from="${AgeGroup.list()}" optionKey="id" noSelection="['': '--Select--']"/>
				</div>
				<div class="fieldcontain">
					<label for="minimumAge">Minimum Age</label>
					<g:select name="minimumAge" from="${1..150}" noSelection="['': '--Select--']" value="none"/>
				</div>
				<div class="fieldcontain">
					<label for="maximumAge">Maximum Age</label>
					<g:select name="maximumAge" from="${1..150}" noSelection="['': '--Select--']" value="none"/>
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
</body>
</html>
  </div>
</body>
</html>