

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <title>Edit EmployeePayrollMaster</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">EmployeePayrollMaster List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New EmployeePayrollMaster</g:link></span>
        </div>
        <div class="body">
            <h1>Edit EmployeePayrollMaster</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${employeePayrollMasterInstance}">
            <div class="errors">
                <g:renderErrors bean="${employeePayrollMasterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:if test="${employeePayrollMasterInstance.COMPOSITE_KEY == false}">
                    <g:if test="${employeePayrollMasterInstance.id.class.name == 'String'}">
                        <input type="hidden" name="id" value="${employeePayrollMasterInstance?.id.trim()}" />
                    </g:if>
                    <g:else>
                        <input type="hidden" name="id" value="${employeePayrollMasterInstance?.id}" />
                    </g:else>
                </g:if>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="socialSecurityNo">Social Security No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'socialSecurityNo','errors')}">
                                    <input type="text" id="socialSecurityNo" name="socialSecurityNo" value="${fieldValue(bean:employeePayrollMasterInstance,field:'socialSecurityNo')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'name','errors')}">
                                    <input type="text" maxlength="40" id="name" name="name" value="${fieldValue(bean:employeePayrollMasterInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'address','errors')}">
                                    <input type="text" maxlength="30" id="address" name="address" value="${fieldValue(bean:employeePayrollMasterInstance,field:'address')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'city','errors')}">
                                    <input type="text" maxlength="20" id="city" name="city" value="${fieldValue(bean:employeePayrollMasterInstance,field:'city')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state">State:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'state','errors')}">
                                    <input type="text" maxlength="2" id="state" name="state" value="${fieldValue(bean:employeePayrollMasterInstance,field:'state')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zipCode">Zip Code:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'zipCode','errors')}">
                                    <input type="text" maxlength="9" id="zipCode" name="zipCode" value="${fieldValue(bean:employeePayrollMasterInstance,field:'zipCode')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="county">County:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'county','errors')}">
                                    <input type="text" maxlength="1" id="county" name="county" value="${fieldValue(bean:employeePayrollMasterInstance,field:'county')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneNo">Phone No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'phoneNo','errors')}">
                                    <input type="text" id="phoneNo" name="phoneNo" value="${fieldValue(bean:employeePayrollMasterInstance,field:'phoneNo')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maritalStatus">Marital Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'maritalStatus','errors')}">
                                    <input type="text" maxlength="1" id="maritalStatus" name="maritalStatus" value="${fieldValue(bean:employeePayrollMasterInstance,field:'maritalStatus')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sexM_MaleF_Female">Sex MM ale FF emale:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'sexM_MaleF_Female','errors')}">
                                    <input type="text" maxlength="1" id="sexM_MaleF_Female" name="sexM_MaleF_Female" value="${fieldValue(bean:employeePayrollMasterInstance,field:'sexM_MaleF_Female')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="raceCode">Race Code:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'raceCode','errors')}">
                                    <input type="text" maxlength="1" id="raceCode" name="raceCode" value="${fieldValue(bean:employeePayrollMasterInstance,field:'raceCode')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="birthDate">Birth Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'birthDate','errors')}">
                                    <g:datePicker name="birthDate" value="${employeePayrollMasterInstance?.birthDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="federalDependants">Federal Dependants:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'federalDependants','errors')}">
                                    <input type="text" id="federalDependants" name="federalDependants" value="${fieldValue(bean:employeePayrollMasterInstance,field:'federalDependants')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stateDependants">State Dependants:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'stateDependants','errors')}">
                                    <input type="text" id="stateDependants" name="stateDependants" value="${fieldValue(bean:employeePayrollMasterInstance,field:'stateDependants')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hireDate">Hire Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'hireDate','errors')}">
                                    <g:datePicker name="hireDate" value="${employeePayrollMasterInstance?.hireDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="msemp">Msemp:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:employeePayrollMasterInstance,field:'msemp','errors')}">
                                    
                                </td>
                            </tr> 
                        
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="newEntity">New Entity:</label>
                            </td>
                            <td valign="top" class="value">

                                <g:checkBox name="newEntity" value="${employeePayrollMasterInstance.newEntity}" disabled="true"/>
                            </td>
                        </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
