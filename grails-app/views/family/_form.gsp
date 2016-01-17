<%@ page import="zw.co.bangsoft.bethel.model.Family" %>



<div class="fieldcontain ${hasErrors(bean: familyInstance, field: 'cellGroup', 'error')} required">
	<label for="cellGroup">
		<g:message code="family.cellGroup.label" default="Cell Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cellGroup" name="cellGroup.id" from="${zw.co.bangsoft.bethel.model.CellGroup.list()}" optionKey="id" required="" value="${familyInstance?.cellGroup?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: familyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="family.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="60" required="" value="${familyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: familyInstance, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="family.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" maxlength="20" value="${familyInstance?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: familyInstance, field: 'cellphone', 'error')} ">
	<label for="cellphone">
		<g:message code="family.cellphone.label" default="Cellphone" />
		
	</label>
	<g:textField name="cellphone" maxlength="15" value="${familyInstance?.cellphone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: familyInstance, field: 'street', 'error')} ">
	<label for="street">
		<g:message code="family.street.label" default="Street" />
		
	</label>
	<g:textField name="street" maxlength="50" value="${familyInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: familyInstance, field: 'suburb', 'error')} ">
	<label for="suburb">
		<g:message code="family.suburb.label" default="Suburb" />
		
	</label>
	<g:textField name="suburb" maxlength="30" value="${familyInstance?.suburb}"/>
</div>



