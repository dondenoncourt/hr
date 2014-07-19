<g:if test="${flash.message}">
 <div class="general msg">${flash.message}</div>
</g:if>
<g:hasErrors bean="${enroll}">
 <div class="errors msg">
     <g:renderErrors bean="${enroll}" as="list" />
 </div>
</g:hasErrors>
<div>
</div>

<fieldset id="coveredFieldSet">
	<legend>2011 Plan Elections</legend>
	<dl>
		<dt>Your current election is:</dt>
		<dd>${enroll.planElectionPrior?:'&#160;'}</dd>
		<dt>Your current coverage is:</dt>
		<dd>${enroll.mdvCoveragePrior?:'&#160;'}</dd>
	</dl>
</fieldset>

<fieldset>
	<legend>Medical, Prescription Drug, Dental and Vision Coverage</legend>
		<g:render template="medDrugDentalVision" model="[enroll:enroll, confirmPage:confirmPage, pdf:params.pdf]" />		
</fieldset>

<fieldset id="coveredFieldSet">
	<legend>Covered Individuals</legend>
	<table id="coveredTable" class="enrollment">
		<thead>
			<tr>
				<th style="width: 12%">Relationship</th>
				<th style="width: 13%;">Sex</th>
				<th style="width: 21%;">Birth Date</th>
				<th style="width: 17%;">Name</th>
				<th style="width: 17%;">Soc Sec#</th>
				<g:if test="${!confirmPage}">
				<th style="width: 20%;">Action</th>
				</g:if>
			</tr>
		</thead>
	</table>
	<% def self = enroll?.covered.find{it.relationship == 'S'} %>
	<g:if test="${self}">
		<g:render template="coveredEdit" model="[enroll:enroll, covered:self, coveredRowNo:0, confirmPage:confirmPage, pdf:params.pdf]" />
	</g:if>
	<g:each in="${(enroll?.covered?.findAll{it.relationship != 'S'}?.sort{it.birth})}" var="covered" status="coveredRowNo">
		<% if (self) coveredRowNo++ %>
		<g:render template="coveredEdit" model="[enroll:enroll, covered:covered, coveredRowNo:coveredRowNo, confirmPage:confirmPage, pdf:params.pdf]" />
	</g:each>	
	<g:if test="${!confirmPage}">
	<div class="add">
	   <a href="#" id="promptNewCovered" class="add button">Add Covered</a>
    </div>
	</g:if>
</fieldset>
<fieldset id="otherCoveragesFieldSet">
	<legend>Other Coverage</legend>
	<table id="otherCoverageTable" class="enrollment">
		<thead>
			<tr>
				<th class="fourCol">Name</th>
				<th class="fourCol">Carrier</th>
				<th class="fourCol">Policy No</th>
				<g:if test="${!confirmPage}">
				<th class="fourCol">Action</th>
				</g:if>
			</tr>
		</thead>
	</table>
	<g:each in="${enroll?.otherCoverages}" var="otherCoverage" status="otherCoverageRowNo">
		<g:render template="otherCoverageEdit" model="[enroll:enroll, otherCoverage:otherCoverage, otherCoverageRowNo:otherCoverageRowNo, confirmPage:confirmPage, pdf:params.pdf]" />
	</g:each>	
	<g:if test="${!confirmPage}">
	<div class="add">
	   <a href="#" id="promptNewOtherCoverage" class="add button">Add Other Coverage</a>
    </div>
	</g:if> 
</fieldset>
<fieldset id="medicareFieldSet">
	<legend>Medicare</legend>
	<table id="medicareTable" class="enrollment">
		<thead>
			<tr>
				<th class="fiveCol">Name</th>
				<th class="fiveCol">Policy No</th>
				<th style="width: 21%;">Effective</th>
				<th style="width: 19%;">Type</th>
				<g:if test="${!confirmPage}">
				<th class="fiveCol">Action</th>
				</g:if>
			</tr>
		</thead>
	</table>
	<g:each in="${enroll?.medicareCoverages?}" var="medicare" status="medicareRowNo">
		<g:render template="medicareEdit" model="[enroll:enroll, medicare:medicare, medicareRowNo:medicareRowNo, confirmPage:confirmPage, pdf:params.pdf]" />
	</g:each>	
	<g:if test="${!confirmPage}">
	<div class="add">
	   <a href="#" id="promptNewMedicare" class="add button">Add Medicare Coverage</a>
	</div>	
	</g:if>
</fieldset>	
