<%@ page import="zw.co.bangsoft.bethel.model.CellGroup" %>



<div class="fieldcontain ${hasErrors(bean: cellGroupInstance, field: 'assembly', 'error')} required">
	<label for="assembly">
		<g:message code="cellGroup.assembly.label" default="Assembly" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="assembly" name="assembly.id" from="${zw.co.bangsoft.bethel.model.Assembly.list()}" optionKey="id" required="" value="${cellGroupInstance?.assembly?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cellGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="cellGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${cellGroupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cellGroupInstance, field: 'leaderName', 'error')} ">
	<label for="leaderName">
		<g:message code="cellGroup.leaderName.label" default="Leader Name" />
		
	</label>
	<g:textField name="leaderName" maxlength="50" value="${cellGroupInstance?.leaderName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cellGroupInstance, field: 'contactPhone', 'error')} ">
	<label for="contactPhone">
		<g:message code="cellGroup.contactPhone.label" default="Contact Phone" />
		
	</label>
	<g:textField name="contactPhone" maxlength="20" value="${cellGroupInstance?.contactPhone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cellGroupInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="cellGroup.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="100" value="${cellGroupInstance?.description}"/>
</div>

