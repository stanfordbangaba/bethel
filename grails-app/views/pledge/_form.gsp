<%@ page import="zw.co.bangsoft.bethel.model.Pledge" %>



<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="pledge.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${zw.co.bangsoft.bethel.model.Project.list()}" optionKey="id" required="" value="${pledgeInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'member', 'error')} required">
	<label for="member">
		<g:message code="pledge.member.label" default="Member" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="member" name="member.id" from="${zw.co.bangsoft.bethel.model.Member.list()}" optionKey="id" required="" value="${pledgeInstance?.member?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="pledge.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="amount" required="" value="${fieldValue(bean: pledgeInstance, field: 'amount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'valueDate', 'error')} required">
	<label for="valueDate">
		<g:message code="pledge.valueDate.label" default="Value Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="valueDate" precision="day"  value="${pledgeInstance?.valueDate}"  />
</div>

