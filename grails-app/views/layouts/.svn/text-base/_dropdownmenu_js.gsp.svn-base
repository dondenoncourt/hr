<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder" %>

<script type="text/javascript">
	var menuwidth = '159px' //default menu width
	var menubgcolor = '#eeedef'  //menu bgcolor
	var disappeardelay = 400  //menu disappear speed onMouseout (in miliseconds)
	var hidemenu_onclick = "yes" //hide menu when user clicks within menu?

	var homePath = "${request.contextPath}/" 
	
	<%def priXpPath = ConfigurationHolder.config.prixp.url %>
	<%def prlib = ConfigurationHolder.config.wow.prlib %>	
	<%def wolib = ConfigurationHolder.config.wow.wolib %>	
	<%def trlib = ConfigurationHolder.config.wow.trlib %>	
	<%def xxlib = ConfigurationHolder.config.wow.xxlib %>	
	<%def hrlib = ConfigurationHolder.config.wow.hrlib %>	
	<%def gllib = ConfigurationHolder.config.wow.gllib %>	
	<%def dwow10 = ConfigurationHolder.config.wow.dwow10 %>	

	var iXpPathNew = "${priXpPath}"
			
	var menuEmpSelfServ = new Array('<a href="' + homePath + 'enroll/contactInfo/">Benefit Enrollment</a>', 
		'<a href="${priXpPath}&lvid=2454&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR" target="_blank">Employee Time Entry</a>',
		'<a href="${priXpPath}&lvid=8004&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR" target="_blank">Pay History</a>');
		//'<a href="' + iXpPath + '&lvid=2454&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR" target="_blank">Employee Time Entry</a>',
		//'<a href="' + iXpPathNew + '&lvid=8004&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR" target="_blank">Pay History</a>');

	//var menuInfoCtr = new Array('<a href="' + homePath + '&lvid=1243&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Search</a>');
	var menuInfoCtr = new Array('<a href="${priXpPath}&lvid=1243&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Search</a>');
	
	var menuTasks = new Array('<a href="${priXpPath}&lvid=1260&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Employee Maintenance</a>',
		'<a href="' + homePath + 'enroll/list' + '">Benefit Enrollment</a>', 
		'<a href="${priXpPath}&lvid=2038&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Calendar</a>', 
		'<a href="${priXpPath}&lvid=1397&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Grievance</a>', 
		'<a href="${priXpPath}&lvid=1400&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Global Updates</a>', 
		'<a href="${priXpPath}&lvid=2454&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Employee Time Entry</a>', 
		'<a href="' + homePath + 'requisition/list">App Tracking</a>', 
		'<a href="' + homePath + 'candidate/search">App Search</a>', 
		'<a href="' + homePath + 'incident/list">Incidents</a>', 
		'<a href="${priXpPath}&lvid=7151&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Education</a>');

	var menuSearch = new Array('<a href="">Basic</a>', '<a href="">Advanced</a>');

	var menuReports = new Array('<a href="' + homePath + 'reports/appraisalSchedule/">Appraisal Schedule</a>',
	//'<a href="${priXpPath}&lvid=1559&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Appraisal Schedule Report</a>', 
	//'<a href="${priXpPath}&lvid=1560&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Birth Date List</a>',
	'<a href="' + homePath + 'reports/birthDate/">Birth Date List</a>', 
	 
    '<a href="${priXpPath}&lvid=7753&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Employee Benefit Report</a>',
	'<a href="${priXpPath}&lvid=5051&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Employee Profile Report</a>', 
	//'<a href="${priXpPath}&lvid=1561&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Hire Date Report</a>',
	'<a href="' + homePath + 'reports/hireDateList/">Hire Date List</a>',
	'<a href="${request.contextPath}/reports/orgChart">Org Chart</a>', 
	'<a href="' + homePath + 'reports/overtime">Overtime Report</a>', 
	//'<a href="${priXpPath}&lvid=1558&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Workforce Analysis</a>', 
	//'<a href="${priXpPath}&lvid=5559&_pj_replace_libs=WOLIB=${wolib},TRLIB=${trlib},XXLIB=${xxlib},PRLIB=${prlib},HRLIB=${hrlib},DWOW10=${dwow10},GLLIB=${gllib}&CALLING_APP=HR">Workforce Analysis By Job Class</a>',
	'<a href="' + homePath + 'reports/workforceAnalysis/">Workforce Analysis</a>',
	'<a href="' + homePath + 'reports/workforceAnalysisByJobClass/">Workforce Analysis By Job Class</a>',
	'<a href="${request.contextPath}/reports/yearsOfService">Years of Service</a>');

	var menuProperties = new Array('<a href="${request.contextPath}/test">Applicant Tests</a>',
			'<a href="${request.contextPath}/behavior">Behavioral Tests</a>',
			'<a href="${request.contextPath}/techNeed">Job Tech Needs</a>',
			'<a href="${request.contextPath}/yesNo">Applicant Yes/No Questions</a>',
			'<a href="${request.contextPath}/approve">Approvers</a>',
			'<a href="${request.contextPath}/compensationTeam">Compensation Team</a>',
			'<a href="${request.contextPath}/jobDescription">Job Descriptions</a>'); 

	var menuCustom = new Array('<a href="${request.contextPath}/reports/yearsOfService">Years of Service</a>', 
		'<a href="${request.contextPath}/reports/hoursWorked">Hours Worked</a>');

	var menuHelp = new Array('<a href="">Change Password</a>', 
			'<a href="${resource(dir:'media',file:'AppTrackingFlow.pdf')}">App Tracking Help</a>'
			//'<a href="">Messages</a>'
			);

	/////No further editting needed

	var ie4 = document.all
	var ns6 = document.getElementById && !document.all

	if (ie4 || ns6)
	    document.write('<div id="dropmenudiv" style="visibility:hidden;width:' + menuwidth + ';background-color:' + menubgcolor + '" onMouseover="clearhidemenu()" onMouseout="dynamichide(event)"></div>')

	function getposOffset(what, offsettype) {
	    var totaloffset = (offsettype == "left") ? what.offsetLeft : what.offsetTop;
	    var parentEl = what.offsetParent;
	    while (parentEl != null) {
	        totaloffset = (offsettype == "left") ? totaloffset + parentEl.offsetLeft : totaloffset + parentEl.offsetTop;
	        parentEl = parentEl.offsetParent;
	    }
	    return totaloffset;
	}


	function showhide(obj, e, visible, hidden, menuwidth) {
	    if (ie4 || ns6)
	        dropmenuobj.style.left = dropmenuobj.style.top = "-500px"
	    if (menuwidth != "") {
	        dropmenuobj.widthobj = dropmenuobj.style
	        dropmenuobj.widthobj.width = menuwidth
	    }
	    if (e.type == "click" && obj.visibility == hidden || e.type == "mouseover")
	        obj.visibility = visible
	    else if (e.type == "click")
	        obj.visibility = hidden
	}

	function iecompattest() {
	    return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body
	}

	function clearbrowseredge(obj, whichedge) {
	    var edgeoffset = 0
	    if (whichedge == "rightedge") {
	        var windowedge = ie4 && !window.opera ? iecompattest().scrollLeft + iecompattest().clientWidth - 15 : window.pageXOffset + window.innerWidth - 15
	        dropmenuobj.contentmeasure = dropmenuobj.offsetWidth
	        if (windowedge - dropmenuobj.x < dropmenuobj.contentmeasure)
	            edgeoffset = dropmenuobj.contentmeasure - obj.offsetWidth
	    }
	    else {
	        var topedge = ie4 && !window.opera ? iecompattest().scrollTop : window.pageYOffset
	        var windowedge2 = ie4 && !window.opera ? iecompattest().scrollTop + iecompattest().clientHeight - 15 : window.pageYOffset + window.innerHeight - 18
	        dropmenuobj.contentmeasure = dropmenuobj.offsetHeight
	        if (windowedge2 - dropmenuobj.y < dropmenuobj.contentmeasure) { //move up?
	            edgeoffset = dropmenuobj.contentmeasure + obj.offsetHeight
	            if ((dropmenuobj.y - topedge) < dropmenuobj.contentmeasure) //up no good either?
	                edgeoffset = dropmenuobj.y + obj.offsetHeight - topedge
	        }
	    }
	    return edgeoffset
	}

	function populatemenu(what) {
	    if (ie4 || ns6)
	        dropmenuobj.innerHTML = what.join("")
	}


	function dropdownmenu(obj, e, menucontents, menuwidth) {
	    if (window.event) event.cancelBubble = true
	    else if (e.stopPropagation) e.stopPropagation()
	    clearhidemenu()
	    dropmenuobj = document.getElementById ? document.getElementById("dropmenudiv") : dropmenudiv
	    populatemenu(menucontents)

	    if (ie4 || ns6) {
	        showhide(dropmenuobj.style, e, "visible", "hidden", menuwidth)
	        dropmenuobj.x = getposOffset(obj, "left")
	        dropmenuobj.y = getposOffset(obj, "top")
	        dropmenuobj.style.left = dropmenuobj.x - clearbrowseredge(obj, "rightedge") + "px"
	        dropmenuobj.style.top = dropmenuobj.y - clearbrowseredge(obj, "bottomedge") + obj.offsetHeight + "px"
	    }

	    return clickreturnvalue()
	}

	function clickreturnvalue() {
	    if (ie4 || ns6) return false
	    else return true
	}

	function contains_ns6(a, b) {
	    while (b.parentNode)
	        if ((b = b.parentNode) == a)
	            return true;
	    return false;
	}

	function dynamichide(e) {
	    if (ie4 && !dropmenuobj.contains(e.toElement))
	        delayhidemenu()
	    else if (ns6 && e.currentTarget != e.relatedTarget && !contains_ns6(e.currentTarget, e.relatedTarget))
	        delayhidemenu()
	}

	function hidemenu(e) {
	    if (typeof dropmenuobj != "undefined") {
	        if (ie4 || ns6)
	            dropmenuobj.style.visibility = "hidden"
	    }
	}

	function delayhidemenu() {
	    if (ie4 || ns6)
	        delayhide = setTimeout("hidemenu()", disappeardelay)
	}

	function clearhidemenu() {
	    if (typeof delayhide != "undefined")
	        clearTimeout(delayhide)
	}

	if (hidemenu_onclick == "yes")
	    document.onclick = hidemenu

	// Initialize AJAX Event
	function GetXmlHttpObject(handler) {
	    var objXMLHttp = null
	    if (window.XMLHttpRequest) {
	        objXMLHttp = new XMLHttpRequest();
	    }
	    else if (window.ActiveXObject) {
	        objXMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
	    }
    return objXMLHttp;
	}
</script>