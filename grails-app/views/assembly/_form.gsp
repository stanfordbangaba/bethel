<%@ page import="zw.co.bangsoft.bethel.model.Assembly" %>



<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'organisation', 'error')} required">
	<label for="organisation">
		<g:message code="assembly.organisation.label" default="Organisation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organisation" name="organisation.id" from="${zw.co.bangsoft.bethel.model.Organisation.list()}" optionKey="id" required="" value="${assemblyInstance?.organisation?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="assembly.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${assemblyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'pastorName', 'error')} required">
	<label for="pastorName">
		<g:message code="assembly.pastorName.label" default="Pastor Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pastorName" maxlength="60" required="" value="${assemblyInstance?.pastorName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="assembly.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" maxlength="30" value="${assemblyInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="assembly.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" maxlength="20" value="${assemblyInstance?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'cellphone', 'error')} ">
	<label for="cellphone">
		<g:message code="assembly.cellphone.label" default="Cellphone" />
		
	</label>
	<g:textField name="cellphone" maxlength="15" value="${assemblyInstance?.cellphone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'street', 'error')} ">
	<label for="street">
		<g:message code="assembly.street.label" default="Street" />
		
	</label>
	<g:textField name="street" maxlength="30" value="${assemblyInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'suburb', 'error')} ">
	<label for="suburb">
		<g:message code="assembly.suburb.label" default="Suburb" />
		
	</label>
	<g:textField name="suburb" maxlength="30" value="${assemblyInstance?.suburb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="assembly.city.label" default="City" />
		
	</label>
	<g:textField name="city" maxlength="30" value="${assemblyInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assemblyInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="assembly.country.label" default="Country" />
		
	</label>
	<g:countrySelect name="country" default="zwe" value="${assemblyInstance?.country}" />
</div>


