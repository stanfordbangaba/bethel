<%@ page import="zw.co.bangsoft.bethel.model.FellowshipGroup" %>



<div class="fieldcontain ${hasErrors(bean: fellowshipGroupInstance, field: 'assembly', 'error')} required">
	<label for="assembly">
		<g:message code="fellowshipGroup.assembly.label" default="Assembly" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="assembly" name="assembly.id" from="${zw.co.bangsoft.bethel.model.Assembly.list()}" optionKey="id" required="" value="${fellowshipGroupInstance?.assembly?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fellowshipGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="fellowshipGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${fellowshipGroupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fellowshipGroupInstance, field: 'leaderName', 'error')} ">
	<label for="leaderName">
		<g:message code="fellowshipGroup.leaderName.label" default="Leader Name" />
		
	</label>
	<g:textField name="leaderName" maxlength="50" value="${fellowshipGroupInstance?.leaderName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fellowshipGroupInstance, field: 'contactPhone', 'error')} ">
	<label for="contactPhone">
		<g:message code="fellowshipGroup.contactPhone.label" default="Contact Phone" />
		
	</label>
	<g:textField name="contactPhone" maxlength="20" value="${fellowshipGroupInstance?.contactPhone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fellowshipGroupInstance, field: 'descrition', 'error')} ">
	<label for="descrition">
		<g:message code="fellowshipGroup.descrition.label" default="Descrition" />
		
	</label>
	<g:textField name="descrition" maxlength="100" value="${fellowshipGroupInstance?.descrition}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fellowshipGroupInstance, field: 'ageGroup', 'error')} required">
	<label for="ageGroup">
		<g:message code="fellowshipGroup.ageGroup.label" default="Age Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ageGroup" name="ageGroup.id" from="${zw.co.bangsoft.bethel.model.AgeGroup.list()}" optionKey="id" required="" value="${fellowshipGroupInstance?.ageGroup?.id}" class="many-to-one"/>
</div>

