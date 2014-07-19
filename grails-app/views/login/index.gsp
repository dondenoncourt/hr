<html>
  <head>
    <meta http-equiv="Content-Type"
           content="text/html; charset=UTF-8"/>          
    <link rel="stylesheet" href="${resource(dir:'css',file:'splash.css')}" />    
    <r:require module="common"/>
    <meta name="layout" content="main" />
    <title>Login</title>
  </head>
  <body>
 	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
    </g:if>
    <div id="daffron">
        <img src="../images/LandingPromo.jpg" height="725" width="725" alt="Daffron User Group Meeting 2011" />
    </div>
    <div id="feedPanel">        
        <g:each in="${feeds?.channel}" var="channel" status="i">
	        <div id="solutionDetail${i}">	        		  
	            <h2>${channel.title}</h2>
	           <h3>${channel.item[0].title}</h3>
	           <% def desc =  channel.item[0].description %>
	           <p>${desc?.size()?desc[0..(desc.size()<10?desc.size()-1:10)]:''}</p>
	        </div>
			<br/>
			<div class="feedList">
				<ul class="feed">
                <g:each in="${channel.item}" var="item" status="j">
					<li>
						<a href="${item.link}" class="channelItem"  channelId="${i}" title="${item.description}">${item.title}</a>
					</li>
			    </g:each>
			    </ul>
		    </div>
		    <br /><br />
	    </g:each>
    </div>
  </body>
<g:javascript>
    $('.channelItem').hover(
        function() { 
            var channelId = $(this).attr('channelId');
	    	$('#solutionDetail'+channelId+' h3').html($(this).html());
	    	$('#solutionDetail'+channelId+' p').html($(this).attr('title'));
    	}
	);
</g:javascript>
</html>
