<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'projectId', 'error')} ">
	<label for="projectId">Project</label>
	<g:select name="projectId" maxlength="30" from="${projectList}" optionKey="id" noSelection="['':'--Select--']" />
</div>