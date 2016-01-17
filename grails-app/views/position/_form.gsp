<%@ page import="zw.co.bangsoft.bethel.model.Position" %>



<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="position.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="30" required="" value="${positionInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="position.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="150" value="${positionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="position.members.label" default="Members" />
		
	</label>
	
</div>

