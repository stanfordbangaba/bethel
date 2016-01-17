<div class="fieldcontain ${hasErrors(bean: receiptInstance, field: 'entityId', 'error')} ">
	<label for="entityId">Receipt Owner</label>
	<g:select name="entityId" maxlength="30" from="${ownerList}" optionKey="id" noSelection="['':'--Select--']" />
</div>