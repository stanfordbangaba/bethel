<%@ page import="zw.co.bangsoft.bethel.model.Receipt" %>
<%@ page import="zw.co.bangsoft.bethel.model.Project" %>

<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'assembly', 'error')} required">
	<label for="assembly">
		<g:message code="receipt.assembly.label" default="Assembly" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="assembly" name="assembly.id" from="${zw.co.bangsoft.bethel.model.Assembly.list()}" optionKey="id" required="" value="${receiptInstance?.assembly?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'receiptNo', 'error')} required">
	<label for="receiptNo">
		<g:message code="receipt.receiptNo.label" default="Receipt No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="receiptNo" maxlength="30" required="" value="${receiptInstance?.receiptNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'narrative', 'error')} ">
	<label for="narrative">
		<g:message code="receipt.narrative.label" default="Narrative" />
		
	</label>
	<g:textField name="narrative" value="${receiptInstance?.narrative}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'valueDate', 'error')} required">
	<label for="valueDate">
		<g:message code="receipt.valueDate.label" default="Value Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="valueDate" precision="day"  value="${receiptInstance?.valueDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="receipt.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${receiptInstance.constraints.type.inList}" value="${receiptInstance?.type}" 
			onChange="${remoteFunction(action:'processTypeValueChange', params:'\'type=\' + this.value', update:'projectId')}"
			valueMessagePrefix="receipt.type" noSelection="['': '--Select--']"/>
</div>

<div id="projectId">
	<g:render template="projectselect" collection="${projectList}"></g:render>
</div>

<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'otherType', 'error')} ">
	<label for="otherType">
		<g:message code="receipt.otherType.label" default="Other Type" />
		
	</label>
	<g:textField name="otherType" maxlength="30" value="${receiptInstance?.otherType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="receipt.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="amount" required="" value="${fieldValue(bean: receiptInstance, field: 'amount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'entityName', 'error')} ">
	<label for="entityName">Payment For</label>
	<g:select name="entityName" from="${receiptInstance.constraints.entityName.inList}" 
		value="${receiptInstance?.entityName}" onChange="${remoteFunction(action:'processEntityNameValueChange', params:'\'entityName=\' + this.value', update:'entityId')}" 
		valueMessagePrefix="receipt.entityName" noSelection="['': '--Select--']"/>
</div>

<div id="entityId">
	<g:render template="ownerselect" collection="${ownerList}"></g:render>
</div>

