<%@ page import="zw.co.bangsoft.bethel.model.Department" %>



<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'assembly', 'error')} required">
	<label for="assembly">
		<g:message code="department.assembly.label" default="Assembly" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="assembly" name="assembly.id" from="${zw.co.bangsoft.bethel.model.Assembly.list()}" optionKey="id" required="" value="${departmentInstance?.assembly?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="department.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${departmentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'leaderName', 'error')} ">
	<label for="leaderName">
		<g:message code="department.leaderName.label" default="Leader Name" />
		
	</label>
	<g:textField name="leaderName" maxlength="50" value="${departmentInstance?.leaderName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'contactPhone', 'error')} ">
	<label for="contactPhone">
		<g:message code="department.contactPhone.label" default="Contact Phone" />
		
	</label>
	<g:textField name="contactPhone" maxlength="20" value="${departmentInstance?.contactPhone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="department.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="100" value="${departmentInstance?.description}"/>
</div>


