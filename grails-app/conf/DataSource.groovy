import java.util.concurrent.ThreadPoolExecutor.Worker;

dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
hr.schema='hrixpgle'
gl.schema='hrixpgle'
//prixp.url='http://172.16.156.96:8091/FMS3111/runApp?id=105&_pj_lib=FMSUSR3111'
prixp.url='http://localhost:8080/hr/wowOut/runApp?id=105&_pj_lib=FMSUSRHR'
prixp.ip='172.16.156.18'
prixp.context.root='FMSUSRHR'
prixp.port='80'
prixp.protocol='http'
hr.company="Daffron &#38; Associates Inc"
hr.address="One Solution Pl, Bowling Green, MO 63334"
hr.props.loc='./src/groovy/'
hr.localHttp.scheme="http"
hr.localHttp.serverName="localhost"
hr.localHttp.serverPort="8080"
hr.jasper.protocol="http"
hr.jasper.serverName="localhost"
hr.jasper.serverPort="8888"

wow.wolib='CUDTAHR'
wow.trlib='CUDTAHR'
wow.xxlib='CUDTAHR'
wow.prlib='CUDTAHR'
wow.hrlib='CUDTAHR'
wow.gllib='CUDTAHR'
wow.dwow10='CUDTAHR'

hr.resume.directory="./target"
hr.resume.max.len.megabytes=10

environments {
    development {
        dataSource {
            url = "jdbc:mysql://localhost/hrixpgle"
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = org.hibernate.dialect.MySQLDialect
            username = "donat"
            password = "vo2max"
            dbCreate = "update"
            logSql = false
        }
		hr.localHttp.serverPort="8080"
		requisition.status.order = ['NEW', 'APPROVE', 'JOBDMOD', 'PREPOSTING', 'IPOSTED', 'XPOSTED', 'HRSELECT', 'SUPERSELECT', 'PRECONTACT', 'TESTING', 'PICK', 'SINTD', 'INTERVIEW', 'BCKGRDCHK', 'OFFERDRUG', 'SUPERSIGNHIRE', 'NEWHIRE']
    }
    test {
        dataSource {
            dbCreate = "update"
			//url = "jdbc:h2:mem:testDb;MVCC=TRUE"
			url = "jdbc:h2:mem:devDB"
        }
		hr.schema=null
		gl.schema=null
    }
    production {
        dataSource {
			pooled = false // when true set properties similar to: 
			/*
			properties {
				maxActive = 50
				maxIdle = 25
				minIdle = 5
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 2000
			}
			*/
			url = "jdbc:as400://10.2.0.211/;transaction isolation=none"
			driverClassName = "com.ibm.as400.access.AS400JDBCDriver"
			dialect = org.hibernate.dialect.DB2400Dialect.class
			username = "daffrcv"
			password = "DARKWOW"		
        }
    }
    CARL {
        dataSource {
//			pooled = false // when true set properties similar to: 
			/*
			properties {
				maxActive = 50
				maxIdle = 25
				minIdle = 5
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 2000
			}
			*/
			url = "jdbc:as400://10.2.0.211/;transaction isolation=none"
			driverClassName = "com.ibm.as400.access.AS400JDBCDriver"
			dialect = org.hibernate.dialect.DB2400Dialect.class
			username = "daffrcv"
			password = "DARKWOW"		
			//	logSql = true
        }
		hr.schema='cudtahr'  
		gl.schema='cudtahr'  
		hr.company='Daffron &#38; Associates Inc'
		hr.address='One Solution Place, Bowling Green, MO 63334'
		prixp.url='http://172.16.156.18:8091/carl/wowOut/runApp?id=105&_pj_lib=FMSUSRHR'
		prixp.context.root='FMSiXpTST'
		hr.props.loc='D:/Tomcat60/tomcat3/conf/carl/'
		hr.localHttp.serverPort="8091"
		prixp.port='8091'
		hr.jasper.serverName="172.16.156.18"
		hr.jasper.serverPort="8091"
		wow.wolib='CUDTAHR'
		wow.trlib='CUDTAHR'
		wow.xxlib='CUDTAHR'
		wow.prlib='CUDTAHR'
		wow.hrlib='CUDTAHR'
		wow.gllib='CUDTAHR'
		wow.dwow10='CUDTAHR'
		//requisition.status.order = ['NEW', 'JOBDMOD', 'PREPOSTING', 'IPOSTED', 'XPOSTED', 'HRSELECT', 'PRESCREEN', 'PHONEINTV', 'SUPERSELECT', 'SINTD', 'INTERVIEW', 'PRECONTACT', 'TESTING', 'PICK', 'BCKGRDCHK', 'DRUG', 'OFFER', 'SUPERSIGNHIRE', 'NEWHIRE'] 
		requisition.status.order = ['NEW', 'APPROVE', 'JOBDMOD', 'PREPOSTING', 'IPOSTED', 'XPOSTED', 'HRSELECT', 'SUPERSELECT', 'PRECONTACT', 'TESTING', 'PICK', 'SINTD', 'INTERVIEW', 'BCKGRDCHK', 'OFFERDRUG', 'SUPERSIGNHIRE', 'NEWHIRE']
		hr.resume.directory="D:/Resume/carl"
    }
	
    GLE {
        dataSource {
			pooled = true
			url = "jdbc:as400://192.168.1.68/;transaction isolation=none"
			driverClassName = "com.ibm.as400.access.AS400JDBCDriver"
			dialect = org.hibernate.dialect.DB2400Dialect.class
			username = "wow"
			password = "Bwallace3"

        }
		hr.schema='cudtahrt'  
		gl.schema='cudtahrt'  
		hr.company='Great Lakes Energy'
		hr.address='P.O. Box 70, Boyne City, MI 49712'
		prixp.url='https://gledaffron:8443/iXpTest/runApp?id=105&_pj_lib=FMSUSRTST'
		hr.props.loc='/Tomcat60/Tomcat Test/src/groovy/'
		hr.localHttp.serverPort="23238"
		hr.jasper.protocol="https"
		hr.jasper.serverName="192.168.1.145"
		hr.jasper.serverPort="8443"
		requisition.status.order = ['NEW', 'APPROVE', 'JOBDMOD', 'PREPOSTING', 'IPOSTED', 'XPOSTED', 'HRSELECT', 'SUPERSELECT', 'PRECONTACT', 'TESTING', 'PICK', 'SINTD', 'INTERVIEW', 'BCKGRDCHK', 'OFFERDRUG', 'SUPERSIGNHIRE', 'NEWHIRE']
    }
	
    MARKETING {
        dataSource {
			pooled = false // when true set properties similar to: 
			url = "jdbc:as400://10.2.0.211/;transaction isolation=none"
			driverClassName = "com.ibm.as400.access.AS400JDBCDriver"
			dialect = org.hibernate.dialect.DB2400Dialect.class
			username = "daffrcv"
			password = "DARKWOW"		
        }
		app.name='carl'
		hr.schema='hrixpgle'  
		gl.schema='hrixpgle'  
		hr.company='Marketing HR Demo'
		hr.address='One Solution Place, Bowling Green, MO 63334'
		prixp.url='http://172.16.156.18:8091/marketing/wowOut/runApp?id=105&_pj_lib=FMSUSRHR'
		prixp.context.root='FMSiXpTST'
		hr.localHttp.serverPort="8091"
		hr.props.loc='D:/Tomcat60/tomcat3/conf/gle/'
		prixp.port='8091'
		hr.jasper.serverName="172.16.156.18"
		hr.jasper.serverPort="8091"
		wow.wolib='HRIXPGLE'
		wow.trlib='HRIXPGLE'
		wow.xxlib='HRIXPGLE'
		wow.prlib='HRIXPGLE'
		wow.hrlib='HRIXPGLE'
		wow.gllib='HRIXPGLE'
		wow.dwow10='HRIXPGLE'
		
		requisition.status.order = ['NEW', 'APPROVE', 'JOBDMOD', 'PREPOSTING', 'IPOSTED', 'XPOSTED', 'HRSELECT', 'SUPERSELECT', 'PRECONTACT', 'TESTING', 'PICK', 'SINTD', 'INTERVIEW', 'BCKGRDCHK', 'OFFERDRUG', 'SUPERSIGNHIRE', 'NEWHIRE']
		hr.resume.directory="D:/Resume"
	}
	AWSRDB {
        dataSource {
            url = "jdbc:mysql://daffron.czgodxwnoqca.us-east-1.rds.amazonaws.com/daffron"
            driverClassName = "com.mysql.jdbc.Driver"
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            username = "donat"
            password = "vo2max"
            dbCreate = "update"
            logSql = false
			pooled = true
        }
		hr.schema='daffron'  
		gl.schema='daffron'  
		hr.company='AWS HR Demo'
		hr.address='One Solution Place, Bowling Green, MO 63334'
		prixp.url='http://172.16.156.18:8091/hrgle/wowOut/runApp?id=105&_pj_lib=FMSUSRHR'
		prixp.context.root='FMSiXpTST'
		hr.localHttp.serverPort="80"
		hr.props.loc='./test/unit/' // daffron
		
		requisition.status.order = ['NEW', 'APPROVE', 'JOBDMOD', 'PREPOSTING', 'IPOSTED', 'XPOSTED', 'HRSELECT', 'SUPERSELECT', 'PRECONTACT', 'TESTING', 'PICK', 'SINTD', 'INTERVIEW', 'BCKGRDCHK', 'OFFERDRUG', 'SUPERSIGNHIRE', 'NEWHIRE']
		hr.resume.directory="."
		
	}
	OZK {
		dataSource {
			pooled = true
			url = "jdbc:as400://172.10.16.6/;transaction isolation=none"
			driverClassName = "com.ibm.as400.access.AS400JDBCDriver"
			dialect = org.hibernate.dialect.DB2400Dialect.class
			username = "TSTPRIXP"
			password = "ZQ29TW7"

		}
		hr.schema='cudtahrt'
		gl.schema='cudtahrt'
		hr.company='Ozarks Electric Cooperative'
		hr.address="3641 Wedington Drive, P.O. Box 848, Fayetteville, AR 72702"
		prixp.url='http://10.24.1.14/FMSiXpTST/runApp?id=105&_pj_lib=FMSUSRTST'
	}
	
}
