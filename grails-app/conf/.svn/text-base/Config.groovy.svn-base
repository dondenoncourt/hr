grails.config.locations = [ "classpath:hr-config.properties",
					"classpath:hr-config.groovy",
					"file:${userHome}/.grails/hr-config.properties",
					"file:${userHome}/.grails/hr-config.groovy" ]
 
// HR enrollment
hr.enrollment.form.return.request='Please complete this form by November 12th'
hr.enrollment.voluntary.insurance.products=[critical_illness:'Critical Illness',
											age_banded_life:'Age Banded Voluntary Life/AD&amp;D',
											flat_rate_life:'Flat Rate Volutary Life']

// the array that follows each key maps to VoluntaryInsurance.COVERED_PERSON_TYPE_MAP
hr.enrollment.voluntary.insurance.covered=[critical_illness:['E','S','C'],
	                                       age_banded_life:['E','S','C'],
										   flat_rate_life:['E','D']
										  ]
// note, the number and spellings of keys in paymentPeriod must match keys in covered above
hr.enrollment.voluntary.insurance.paymentPeriod=[critical_illness:'Per Pay',
	                                       age_banded_life:'Per Month',
										   flat_rate_life:'Per Month'
										  ]
// note, the number and spellings of keys in options must match keys in covered above
// the array that follows each key maps to VoluntaryInsurance.OPTION_TYPE_MAP
hr.enrollment.voluntary.insurance.options=[critical_illness:['C','N', 'X'],
	                                       age_banded_life:['C','N', 'X'],
										   flat_rate_life:['C', 'X']
										  ]

hr.enrollment.form.important.info="""
<h1>Important Information Regarding Coverage for Adult Dependents and Removal of Lifetime Limits</h1>
<br/>
<p>Due to the Patient Protection and Affordable Care Act (PPACA), also referred to as Health Care Reform, your
dependents may be eligible to continue on, be added or be reâ€?enrolled in the Great Lakes Energy group health plan effective
January 1, 2011. The two provisions include:
</p>
<ol>
    <li>The extension of dependent coverage to age 26. Any adult dependent that has been or was otherwise scheduled
        to be dropped from a health plan due to not meeting previous eligibility requirements can re-enroll or remain on the
        plan effective January 1, 2011. Eligible dependents for medical coverage are those age 19 to 26 related to the em-
        ployee by birth, marriage, legal adoption or legal guardianship.
        The removal of lifetime limits on essential medical services. Any individual that has been dropped from a health</li>
    <li>
        plan due to exceeding their lifetime limit can re-enroll effective January 1, 2011.</li>
</ol>        
<p>Although enrollment forms are due back to Human Resources by November 12, 2010, any eligible dependent changes, as
described above, can be made through November 30, 2010 by contacting Anjanette Reynolds.</p>
<br/>
"""
// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.views.javascript.library="jquery"

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable for AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']


logFile = "./daffron_hr.log" // override in evironments[prod,dev,test]


xxauops.min.op.id=55000
xxauops.max.op.id=59999


// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://www.changeme.com"
		grails { mail { props = ["mail.smtp.auth":"true", "mail.smtp.socketFactory.port":"465", "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory", "mail.smtp.socketFactory.fallback":"false"] } }
    }
    development {
        /*grails.serverURL = "http://grailsdev:8080/${appName}"
		grails {
			mail {
				 host="10.2.1.25" // "72.14.78.54"  //mail.daffron.com"
				 port="25"
				 user="jobs"
				 username="jobs"//"jobs"
				 password="lisadonsteph"
				 props = ["mail.smtp.auth":"false", "mail.transport.protocol":"smtp", "mail.debug":"false"]
			 }
		 }
		 */
		
		grails {
			mail {
				  host = "smtp.gmail.com"
				  port = 465
				  username = "steph.bruner@gmail.com"
				  password = "gemini612"
				  props = ["mail.smtp.auth":"true", "mail.smtp.socketFactory.port":"465", "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory", "mail.smtp.socketFactory.fallback":"false"]
			}
		}
    }
    test {
        grails.serverURL = "http://localhost:8080/${appName}"
		grails { mail { props = ["mail.smtp.auth":"true", "mail.smtp.socketFactory.port":"465", "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory", "mail.smtp.socketFactory.fallback":"false"] } }
    }
    CARL {
        grails.serverURL = "http://172.16.156.18:8091/carl"
		/*
		grails {
			mail {
				 host="10.2.1.25" // "72.14.78.54"  //mail.daffron.com"
				 port="25"
				 user="jobs"
				 username="jobs"//"jobs"
				 password="lisadonsteph"
				 props = ["bogus":"valuehere", "mail.smtp.auth":"false", "mail.transport.protocol":"smtp", "mail.debug":"true"]
			 }
		 }
		 */
		grails {
			mail {
				  host = "smtp.gmail.com"
				  port = 465
				  username = "steph.bruner@gmail.com"
				  password = "gemini612"
				  props = ["mail.smtp.auth":"true", "mail.smtp.socketFactory.port":"465", "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory", "mail.smtp.socketFactory.fallback":"false"]
			}
		}
    }
	GLE {
        grails.serverURL = "https://192.168.1.145:8443/${appName}"
		grails {
			mail {
			  host = "mail.glenergy.local"
			  port = 25
			}
        }
	}
	MARKETING {
		grails.serverURL = "http://172.16.156.18:8091/${appName}"
		grails {
			mail {
				 host="10.2.1.25" // "72.14.78.54"  //mail.daffron.com"
				 port="25"
				 user="jobs"
				 username="jobs"//"jobs"
				 password="lisadonsteph"
				 props = ["bogus":"valuehere", "mail.smtp.auth":"false", "mail.transport.protocol":"smtp", "mail.debug":"true"]
			 }
		 }	
	}

}

// log4j configuration
log4j = {
	appenders {
		  rollingFile name:"rollingFile", file:logFile, maxFileSize:'3MB', append:false, layout: pattern(conversionPattern: '%-5p %c{1} %d{dd MMM HH:mm:ss} %m%n')
		  console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
	}
	

    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
           'org.codehaus.groovy.grails.web.pages', //  GSP
           'org.codehaus.groovy.grails.web.sitemesh', //  layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping', // URL mapping
           'org.codehaus.groovy.grails.commons', // core / classloading
           'org.codehaus.groovy.grails.plugins', // plugins
           'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate',
		   'grails.app.services.org.grails.plugin.resource',
           'grails.app.taglib.org.grails.plugin.resource',
           'grails.app.resourceMappers.org.grails.plugin.resource',
           'grails.app.services.NavigationService'
		   
	debug rollingFile:"grails.app"

    warn   'org.mortbay.log'

	// to see values for inserts etc.
	//trace "org.hibernate.SQL", "org.hibernate.type"

}

//modules = {
//	core {
	//	dependsOn 'jquery, utils'
		//defaultBundle 'ui'

		//resource url:'/js/core.js', 
		//disposition: 'head' 
		//resource url:'/js/ui.js' 
		//resource url:'/css/main.css' 
		//resource url:'/css/branding.css' 
		//resource url:'/css/print.css' 
		//attrs:[media:'print'] 
	//}

	//utils { 
		//dependsOn 'jquery'

		//resource url:'/js/utils.js' 
	//}

	//forms { 
		//dependsOn 'core,utils' 
		//defaultBundle 'ui'

		//resource url:'/css/forms.css' 
		//resource url:'/js/forms.js' 
	//} 

//}
 

