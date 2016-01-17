<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="zw.co.bangsoft.bethel.model.Member" %>
<%@ page import="zw.co.bangsoft.bethel.model.Family" %>
<%@ page import="zw.co.bangsoft.bethel.model.AgeGroup" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<g:javascript library="jquery"></g:javascript>
<title>Member Reports</title>
</head>
<body>
  <div class="body">
  	<a href="#list-member" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">New Member</g:link></li>
				<li><g:link class="list" action="list">Member List</g:link></li>
			</ul>
		</div>
		
		<div id="list-member" class="content scaffold-create" role="main">
		
		<h1>Member Reports</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>

		<div class="search">
			
			<g:form>
			
				<div class="fieldcontain">
					<label for="reportTitle">Report Title</label>
					<g:textField name="reportTitle" />
				</div>				
				<div class="fieldcontain">
					<label for="ageGroup.id">Age Group</label>
					<g:select name="ageGroup.id" from="${AgeGroup.list()}" optionKey="id" noSelection="['': '--Select--']"/>
				</div>
				
				<g:render template="search"></g:render>
				
				<fieldset class="buttons">
					<bang:exportFormats/>
				</fieldset>
			
			</g:form>
			
		</div>		
	</div>
  </div>
</body>
</html>