<%@ page import="zw.co.bangsoft.bethel.model.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'assembly', 'error')} required">
	<label for="assembly">
		<g:message code="project.assembly.label" default="Assembly" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="assembly" name="assembly.id" from="${zw.co.bangsoft.bethel.model.Assembly.list()}" optionKey="id" required="" value="${projectInstance?.assembly?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="project.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${projectInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="project.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="100" value="${projectInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'targetAmount', 'error')} required">
	<label for="targetAmount">
		<g:message code="project.targetAmount.label" default="Target Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="targetAmount" required="" value="${fieldValue(bean: projectInstance, field: 'targetAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'dateOpened', 'error')} required">
	<label for="dateOpened">
		<g:message code="project.dateOpened.label" default="Date Opened" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOpened" precision="day"  value="${projectInstance?.dateOpened}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'dateClosed', 'error')} ">
	<label for="dateClosed">
		<g:message code="project.dateClosed.label" default="Date Closed" />
		
	</label>
	<g:datePicker name="dateClosed" precision="day"  value="${projectInstance?.dateClosed}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="project.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${projectInstance.constraints.status.inList}" required="" value="${projectInstance?.status}" valueMessagePrefix="project.status"/>
</div>



