<%@ page import="zw.co.bangsoft.bethel.model.AgeGroup" %>



<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'organisation', 'error')} required">
	<label for="organisation">
		<g:message code="ageGroup.organisation.label" default="Organisation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organisation" name="organisation.id" from="${zw.co.bangsoft.bethel.model.Organisation.list()}" optionKey="id" required="" value="${ageGroupInstance?.organisation?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ageGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${ageGroupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'minimumAge', 'error')} required">
	<label for="minimumAge">
		<g:message code="ageGroup.minimumAge.label" default="Minimum Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="minimumAge" from="${1..100}" class="range" required="" value="${fieldValue(bean: ageGroupInstance, field: 'minimumAge')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'maximumAge', 'error')} required">
	<label for="maximumAge">
		<g:message code="ageGroup.maximumAge.label" default="Maximum Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="maximumAge" from="${1..150}" class="range" required="" value="${fieldValue(bean: ageGroupInstance, field: 'maximumAge')}"/>
</div>

