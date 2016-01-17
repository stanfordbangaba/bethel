<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="zw.co.bangsoft.bethel.model.FellowshipGroup" %>
<%@ page import="zw.co.bangsoft.bethel.model.AgeGroup" %>
<%@ page import="zw.co.bangsoft.bethel.model.Member" %>

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
				<li><g:link class="create" action="create">New FellowshipGroup</g:link></li>
			</ul>
		</div>
		
		<div id="list-member" class="content scaffold-create" role="main">
		
		<h1>Search FellowshipGroup Members</h1>
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
					<label for="gender">Gender</label>
					<g:select name="gender" from="${Member.constraints.gender.inList}" noSelection="['': '--Select--']"/>
				</div>
				<div class="fieldcontain">
					<label for="maritalStatus">Marital Status</label>
					<g:select name="maritalStatus" from="${Member.constraints.maritalStatus.inList}" noSelection="['': '--Select--']"/>
				</div>
				<div class="fieldcontain">
					<label for="familyRelationship">Family Relationship</label>
					<g:select name="familyRelationship" from="${Member.constraints.familyRelationship.inList}" noSelection="['': '--Select--']"/>
				</div>
					<div class="fieldcontain">
					<label for="dateFrom">Registration Date From</label>
					<g:datePicker name="dateFrom" precision="day" noSelection="['': '--Select--']" default="none" relativeYears="${-20..1}"/>
				</div>
				<div class="fieldcontain">
					<label for="dateTo">Registration Date To</label>
					<g:datePicker name="dateTo" precision="day" noSelection="['': '--Select--']" default="none" relativeYears="${-20..1}"/>
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