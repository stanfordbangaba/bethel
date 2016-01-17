
<%@ page import="zw.co.bangsoft.bethel.model.Receipt" %>
<%@ page import="zw.co.bangsoft.bethel.model.Project" %>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<g:javascript library="jquery"></g:javascript>
<title>Search Receipts</title>
</head>
<body>
  <div class="body">
  	<a href="#list-receipt" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">New Receipt</g:link></li>
			</ul>
		</div>
		
		<div id="list-member" class="content scaffold-create" role="main">
		
		<h1>Search Receipts</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>

		<div class="search">
			<g:formRemote name="searchForm" url="[action:'doSearch']" update="search-results">
				<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'type', 'error')} ">
					<label for="type">
						<g:message code="receipt.type.label" default="Payment Type" />
					</label>
					<g:select name="type" from="${Receipt.constraints.type.inList}"
						valueMessagePrefix="receipt.type" noSelection="['': '--Select--']"/>
				</div>
				<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'entityName', 'error')} ">
					<label for="entityName">Payment For</label>
					<g:select name="entityName" from="${Receipt.constraints.entityName.inList}" 
						value="${receiptInstance?.entityName}" 
						onChange="${remoteFunction(action:'processEntityNameValueChange', params:'\'entityName=\' + this.value', update:'entityId')}" 
						valueMessagePrefix="receipt.entityName" noSelection="['': '--Select--']"/>
				</div>

				<div id="entityId">
					<g:render template="ownerselect" collection="${ownerList}"></g:render>
				</div>
				<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'projectId', 'error')} ">
					<label for="projectId">
						<g:message code="receipt.type.label" default="Project" />
					</label>
					<g:select name="projectId" from="${Project.list()}" optionKey="id" noSelection="['': '--Select--']" default="none"/>
				</div>
				<div class="fieldcontain">
					<label for="receiptNo">Receipt No</label>
					<g:textField name="receiptNo"/>
				</div>
				<div class="fieldcontain">
					<label for="valueDate">Value Date</label>
					<g:datePicker name="valueDate" precision="day" noSelection="['': '--Select--']" default="none" relativeYears="${-10..0}"/>
				</div>
				<div class="fieldcontain">
					<label for="dateFrom">Payment Date From</label>
					<g:datePicker name="dateFrom" precision="day" noSelection="['': '--Select--']" default="none" relativeYears="${-10..0}"/>
				</div>
				<div class="fieldcontain">
					<label for="dateTo">Payment Date To</label>
					<g:datePicker name="dateTo" precision="day" noSelection="['': '--Select--']" default="none" relativeYears="${-10..0}"/>
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