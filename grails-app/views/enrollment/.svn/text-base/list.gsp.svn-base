

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <r:require module="common"/>
        <title>EmployeePayrollMaster List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New EmployeePayrollMaster</g:link></span>
        </div>
        <div class="body">
            <h1>EmployeePayrollMaster List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="socialSecurityNo" title="Social Security No" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="address" title="Address" />
                        
                   	        <g:sortableColumn property="city" title="City" />
                        
                   	        <g:sortableColumn property="state" title="State" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${employeePayrollMasterInstanceList}" status="i" var="employeePayrollMasterInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
							<td><cas:linkWithKey domain="${employeePayrollMasterInstance}"   action="show"/></td>
                        
                            <td>${employeePayrollMasterInstance.socialSecurityNo?.encodeAsHTML()}</td>
                        
                            <td>${employeePayrollMasterInstance.name?.encodeAsHTML()}</td>
                        
                            <td>${employeePayrollMasterInstance.address?.encodeAsHTML()}</td>
                        
                            <td>${employeePayrollMasterInstance.city?.encodeAsHTML()}</td>
                        
                            <td>${employeePayrollMasterInstance.state?.encodeAsHTML()}</td>
                            <td><g:link controller="BCBS" action="addEnrollment" id="${employeePayrollMasterInstance.id}">Add Enrollment</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${EmployeePayrollMaster.count()}" />
            </div>
        </div>
    </body>
</html>
