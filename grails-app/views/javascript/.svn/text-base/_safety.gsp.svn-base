<g:javascript>
	function getEmpNames(request, response) {
	    $.ajax({
	        url: "${createLink(controller:'employee', action:'empNames')}", 
	        data: "name="+request.term,
	        type: "POST",
	        dataFilter: function(data) { return data; },
	        success: function(data) {response($.map(data, function(item) {return {value: item.name}}))},
	        error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
	    });
	}
	function getDocNames(request, response) {
	    $.ajax({
	        url: "${createLink(controller:'incident', action:'docNames')}", 
	        data: "name="+request.term,
	        type: "POST",
	        dataFilter: function(data) { return data; },
	        success: function(data) {response($.map(data, function(item) {return {value: item.name}}))},
	        error: function(XMLHttpRequest, textStatus, errorThrown) {alert(textStatus);}
	    });
	}
</g:javascript>