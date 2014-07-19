<g:if test="${reqCandi.contactedForTest}">
    <span style="background-color: #99FFCC; font-weight: bold; font-size: 12px;">    
        ${reqCandi.onsiteTest?'On-Site Test Scheduled for ':'Online Test'}
        ${reqCandi.onsiteTest?:''}
    </span><br /><br />
</g:if>
<span id="onlineOrOnsite${reqCandi.id}">	
    <input type="radio" name="onlineOrOnsite${reqCandi.id}" reqCandiId="${reqCandi.id}" value="online"
     ${reqCandi.contactedForTest?(reqCandi.onsiteTest?'':'checked' ):''} 
    /> On-line 
    <input type="radio" name="onlineOrOnsite${reqCandi.id}" reqCandiId="${reqCandi.id}" value="onsite"
     ${reqCandi.contactedForTest?(reqCandi.onsiteTest?'checked':'' ):''} 
    /> On-Site
</span>
<span id="onsiteTest${reqCandi.id}" class="onsiteTest ${reqCandi.contactedForTest?(reqCandi.onsiteTest?'show':'hide' ):''}">
    <g:form action="onsiteTestDate">
        <g:hiddenField name="id" value="${reqCandi.id}"/>
        <g:datePicker name="onsiteTest" />
        <input class="cal button" type="button" name="onsiteTestButton" 
           value="${reqCandi.contactedForTest?'re-':''}Schedule" 
        />
    </g:form>
</span>