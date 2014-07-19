<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'splash.css')}" />
    <r:require module="common"/>
    <title>Login</title>
  </head> 
  <body>
	  <h1>Login</h1>
	  <g:if test="${flash.message}">
	    <div class="msg general">${flash.message}</div>
	  </g:if>
	  <g:form action="authenticate" method="post" >
      <table id="Login">
        <tbody>
           <tr class="prop">
             <td class="name">
               <label for="user">Login:</label>
             </td>
             <td>
               <input type="text" id="user" name="user" value="${params.user}"/>
             </td>
           </tr>
           <tr class="prop">
             <td class="name">
               <label for="password">Password:</label>
             </td>
             <td>
               <input type="password" id="password" name="password"/>
             </td>
            </tr>
            <tr>
               <td colspan="2" class="spacer">&nbsp;</td>
            </tr>
            <tr>
             <td class="buttons" colspan="2">
          		<input type="submit" class="login" value="Login" />
             </td>
           </tr>
        </tbody>
      </table>
	  </g:form>
  </body>
</html>
