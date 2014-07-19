

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <title>Show EmployeePayrollMaster</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">EmployeePayrollMaster List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New EmployeePayrollMaster</g:link></span>
        </div>
        <div class="body">
            <h1>Show EmployeePayrollMaster</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Social Security No:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.socialSecurityNo}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.name}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Address:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.address}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">City:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.city}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">State:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.state}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Zip Code:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.zipCode}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">County:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.county}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Phone No:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.phoneNo}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Marital Status:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.maritalStatus}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sex MM ale FF emale:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.sexM_MaleF_Female}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Race Code:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.raceCode}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Birth Date:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.birthDate}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Federal Dependants:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.federalDependants}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">State Dependants:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.stateDependants}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Hire Date:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.hireDate}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Msemp:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.msemp}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">New Entity:</td>
                            
                            <td valign="top" class="value">${employeePayrollMasterInstance.newEntity}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
	                <cas:hiddenInputKey domain="${employeePayrollMasterInstance}"/>
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
