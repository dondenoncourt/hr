	<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder" %>
	
	<%def company = ConfigurationHolder.config.hr.company %>
	
	<div id="header">
	   <div id="headerTop">
			<div id="logo">
				<a href="http://www.daffron.com" target="_blank">
				    <r:img uri="/plugins/payrolldb-0.1/images/common/DaffLogo.jpg" alt="Daffron - The Solution You Want, The Service You Need" border="0" />
				</a>
			</div>
			<div id="slogan">
			     <span>The Software You Want.</span><br />
			     <span style="margin-left: 31px; line-height: 28px;">The Service You Need.</span>
			</div>
			<div id="iXpLogo">
			 <a href="http://www.daffron.com/solution/solutionsoverview.aspx" target="_blank"><r:img uri="/plugins/payrolldb-0.1/images/common/ixpCube3D.png" alt="Daffron HRiXp" border="0" /></a>
			</div>
		</div>
		<div class="clear"></div>
		<div id="navBar">
			<g:if  test="${session.user}">
				 <table cellspacing="0" cellpadding="0" id="menu1" class="ddmx">
			       <tr>    
					<td>
			            <a class="item1" onclick="return false;" onmouseover="dropdownmenu(this, event, menuEmpSelfServ, '135px')" onmouseout="delayhidemenu()" href="#" >Employee Self Service</a>
					</td>
					
					<% if (session.user?.hrSecurityLevel >= 1) { %>
			        <td>
			            <a class="item1" onclick="return false;" onmouseover="dropdownmenu(this, event, menuInfoCtr, '55px')" onmouseout="delayhidemenu()" href="#">Info Center</a>
					</td>
					<td>
			            <a class="item1" onclick="return false;" onmouseover="dropdownmenu(this, event, menuTasks, '144px')" onmouseout="delayhidemenu()" href="#">Tasks</a>
					</td>						
					<% } %>
					
					<td style="display: none;">
			            <a class="item1" onclick="return false;" onmouseover="dropdownmenu(this, event, menuSearch, '69px')" onmouseout="delayhidemenu()" href="#">Search</a>
					</td>
					
					<% if (session.user?.hrSecurityLevel >= 2) { %>
					<td>
			            <a class="item1" onclick="return false;" onmouseover="dropdownmenu(this, event, menuReports, '200px')" onmouseout="delayhidemenu()" href="#">Reports</a>
					</td>
					<% } %>
					
					<td>
						<a class="item1" onclick="return false;" onmouseover="dropdownmenu(this, event, menuCustom, '120px')" onmouseout="delayhidemenu()" href="#">Custom</a>
					</td>
					
					<% if (session.user?.hrAdmin) { %>
					<td>
			            <a class="item1" onclick="return false;" onmouseover="dropdownmenu(this, event, menuProperties, '175px')" onmouseout="delayhidemenu()" href="#">Properties</a>
					</td>
					<% } %>
					<td>
			            <a class="item1" onclick="return false;" onmouseover="dropdownmenu(this, event, menuHelp, '122px')" onmouseout="delayhidemenu()" href="#">Help</a>
					</td>				
				</tr>
			  </table>
			</g:if>
		</div>
	</div>	
	<div class="clear"></div>
	<g:if test="${session.user}">
		<div id="userInfo">
		   <table>
		       <tr>
		           <td class="left">&nbsp;</td>
		           <td class="content">
		               <span style="float: left;">${ConfigurationHolder.config.hr.company}</span>
		               <span style="float: right;">Welcome ${session?.user?.id}! | <g:link action="logout" controller="login">Sign Off</g:link></span>    
	               </td>
		           <td class="right">&nbsp;</td>
		       </tr>
		   </table>
		</div>
	    <div class="clear"></div>
    </g:if>