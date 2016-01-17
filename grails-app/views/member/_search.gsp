<%@ page import="zw.co.bangsoft.bethel.model.Member" %>
<%@ page import="zw.co.bangsoft.bethel.model.Family" %>

<div class="fieldcontain">
	<label for="family.id">Family</label>
	<g:select name="family.id" from="${Family.list()}" optionKey="id" noSelection="['': '--Select--']"/>
</div>
<div class="fieldcontain">
	<label for="lastName">Lastname</label>
	<g:textField name="lastName"/>
</div>
<div class="fieldcontain">
	<label for="gender">Gender</label>
	<g:select name="gender" from="${Member.constraints.gender.inList}" noSelection="['': '--Select--']"/>
</div>
<div class="fieldcontain">
	<label for="maritalStatus">Marital Status</label>
	<g:select name="maritalStatus" from="${Member.constraints.maritalStatus.inList}" noSelection="['': '--Select--']"/>
</div>
<div class="fieldcontain">
	<label for="familyRelationship">Family Relationship</label>
	<g:select name="familyRelationship" from="${Member.constraints.familyRelationship.inList}" noSelection="['': '--Select--']"/>
</div>
<div class="fieldcontain">
	<label for="dateFrom">Registration Date From</label>
	<g:datePicker name="dateFrom" precision="day" noSelection="['': '--Select--']" default="none" relativeYears="${-30..0}"/>
</div>
<div class="fieldcontain">
	<label for="dateTo">Registration Date To</label>
	<g:datePicker name="dateTo" precision="day" noSelection="['': '--Select--']" default="none" relativeYears="${-30..0}"/>
</div>
<br/>
