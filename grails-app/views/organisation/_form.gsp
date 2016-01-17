<%@ page import="zw.co.bangsoft.bethel.model.Organisation" %>



<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="organisation.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${organisationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="organisation.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" maxlength="40" value="${organisationInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'landline', 'error')} ">
	<label for="landline">
		<g:message code="organisation.landline.label" default="Landline" />
		
	</label>
	<g:textField name="landline" maxlength="15" value="${organisationInstance?.landline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'cellphone', 'error')} ">
	<label for="cellphone">
		<g:message code="organisation.cellphone.label" default="Cellphone" />
		
	</label>
	<g:textField name="cellphone" maxlength="15" value="${organisationInstance?.cellphone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'street', 'error')} ">
	<label for="street">
		<g:message code="organisation.street.label" default="Street" />
		
	</label>
	<g:textField name="street" maxlength="30" value="${organisationInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'suburb', 'error')} ">
	<label for="suburb">
		<g:message code="organisation.suburb.label" default="Suburb" />
		
	</label>
	<g:textField name="suburb" maxlength="30" value="${organisationInstance?.suburb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="organisation.city.label" default="City" />
		
	</label>
	<g:textField name="city" maxlength="30" value="${organisationInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="organisation.country.label" default="Country" />
		
	</label>
	<g:textField name="country" maxlength="30" value="${organisationInstance?.country}"/>
</div>


