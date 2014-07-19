package daffron.fms.hr.payroll

import org.xhtmlrenderer.css.parser.property.PrimitivePropertyBuilders.Top;

import daffron.fms.hr.payroll.EmployeePayrollMaster as PayrollMaster
import daffron.fms.hr.recruiting.JobClassDescription as JobClassDesc
import daffron.fms.hr.payroll.SalaryHistory as SalHist
import daffron.fms.hr.payroll.Earning
import daffron.fms.hr.payroll.Earning2
import daffron.fms.hr.DifferentialRates

import groovy.sql.Sql
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

import daffron.fms.hr.AuthorizeOperation


class ReportsController {
	def sessionFactory

	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}


    def index = { }
	
	@AuthorizeOperation( level='4', text='List organization chart' )
	def orgChart = {
		def top = [:]
		EmployeePayrollMaster.findAllBySupervisorEmpNo(0).each{supervisor ->
			top[supervisor] = subordinants(supervisor)
		}
		def orgList = '<ul id="orgList" class="hide">'
		orgList += buildOrgList(top)
		orgList += '</ul>' 
		[orgMap:top, orgList:orgList]	
	}
	private String buildOrgList(Map map) {
		def orgList = ''
		map.each{supervisor ->
			orgList += '<li>'+supervisor.key.name+'<br/>'+(supervisor.key.jobClassDescription?:'')
			if (supervisor.value.size()) {
				orgList += '<ul>'+buildOrgList(supervisor.value)+'</ul>'
			}
			orgList += '</li>'
		}
		orgList
	}
	private subordinants(EmployeePayrollMaster supervisor) {
		def nextTierOfSupervisors = [:]
		EmployeePayrollMaster.findAllBySupervisorEmpNo(supervisor.id).each{supervisor2 ->
			nextTierOfSupervisors[supervisor2] = subordinants(supervisor2)
		}
		nextTierOfSupervisors
	}
	
	@AuthorizeOperation( level='4', text='List years of service' )
	def yearsOfService = {
		params.max = params.max?:10
		if (params.pdf || params.excel) {
			params.max = null
			params.offset = null
		}
		if (params.excel) {
			response.setContentType("application/excel")
			response.setHeader("Content-disposition", "attachment; filename=YearsOfService.xls")
		}
		[payrollList:PayrollMaster.list(params), count:PayrollMaster.count()]
	}
	@AuthorizeOperation( level='4', text='List overtime' )
	def overtime = {
		params.max = params.max?:10
		if (params.pdf || params.excel) {
			params.max = null
			params.offset = null
		}
		if (params.excel) {
			response.setContentType("application/excel")
			response.setHeader("Content-disposition", "attachment; filename=Overtime.xls")
		}
		[payrollList:PayrollMaster.list(params), count:PayrollMaster.count()]
		
		//Sql sql = new Sql(sessionFactory.getCurrentSession().connection())
		
		//String query = """SELECT msEmp, msName, mstdt, 
			//sum(xOth) as msmOth, 
			//sum(xOtg) as msmOtg, 
			//sum(xDth) as msmDth, 
			//sum(xDtg) as msmDtg, 
			//sum(xOth) + sum(xDth) as ms_TotalOverTimeHours, 
			//sum(xOtg) + sum(xDtg) as ms_TotalOverTimeGross,
			//sum(xGross) as ms_GrossPay 
		//FROM (Select msEmp, msName, mstdt, 
			//sum (case when etType='O' and jdecode is null then ermHrs+ercHrs else 0 end) as xOth, 
			//sum (case when etType='O' and jdecode is null then ermEarn+ercEarn else 0 end) as xOtg, 
			//sum (case when etType='D' and jdecode is null then ermHrs+ercHrs else 0 end) as xDth, 
			//sum (case when etType='D' and jdecode is null then ermEarn+ercEarn else 0 end) as xDtg, 
			//sum (ermEarn + ercEarn) as xGross 
		//FROM ${CH.config.hr.schema}.prpMst 
			//left join ${CH.config.hr.schema}.prpEarn on msEmp = erEmp 
			//left join ${CH.config.hr.schema}.prpErnt on erCode = etCode 
			//left join (select distinct jdecode from ${CH.config.hr.schema}.hrpjdiff)x on ercode = jdecode 
		//WHERE mstdt = '01/01/0001' or ermEarn <> 0 or ercEarn <> 0 
		//GROUP BY msName, msemp) as x"""
		
		//log.debug query
		
		//headings[0] = 'Name'
        //headings[1] = 'Emp No'
		
		//[sql:sql, query:query]
	}
	@AuthorizeOperation( level='4', text='List hours worked' )
	def hoursWorked = {
	}
	@AuthorizeOperation( level='4', text='List appraisal schedule' )
	def appraisalSchedule = {
		params.max = params.max?:3
		if (params.pdf || params.excel) {
			params.max = null
			params.offset = null
		}
		if (params.excel) {
			response.setContentType("application/excel")
			response.setHeader("Content-disposition", "attachment; filename=AppraisalSchedule.xls")
		}				
		def appraisalList
		
		params.startDate = params.startDate?:'01/01/1901'
		def newStartDate= new Date().parse("MM/dd/yyyy", "${params.startDate}")
		def newEndDate = params.endDate?new Date().parse("MM/dd/yyyy", "${params.endDate}"):null
		def empID = params.eeName?PayrollMaster.findByName(params.eeName)?.id:0
		def crit = PayrollMaster.createCriteria()
		appraisalList = crit.list(params) {
			if (params.startDate && params.endDate) {					
				between ("scheduledReviewDate", newStartDate, newEndDate)
			}
			if (params.eeName) {					
				eq("id", empID)
			}
		}	
		int count = PayrollMaster.withCriteria {
			if (params.startDate && params.endDate) {
				between ("scheduledReviewDate", newStartDate, newEndDate)
			}
			if (params.eeName) {
				eq("id", empID)
			}
			projections {rowCount()}
		   }[0]?:1
	  
		if (params.startDate=='01/01/1901') {
			params.startDate = null
		}
		[appraisalList:appraisalList, params:params, count:count]		
	}
	@AuthorizeOperation( level='4', text='List birth dates' )
	def birthDate = {
		params.max = params.max?:10
		params.month = params.month?:0
		if (params.pdf || params.excel) {
			params.max = null
			params.offset = null
		}
		if (params.excel) {
			response.setContentType("application/excel")
			response.setHeader("Content-disposition", "attachment; filename=BirthDateList.xls")
		}
		def payrollList
		int kount
		def months = ['never', "January", "February", "March", "April", 'May', 'June', 'July', 'August', 'September', 'October','November','December']
		if (params.month?.toInteger() > 0) {
			flash.message = "List all with birth dates in "+months[params.month.toInteger()]
			payrollList = PayrollMaster.withCriteria(params) {
				sqlRestriction "month(msbdt) = ${params.month}"
				if (params.max) {
					maxResults params.max.toInteger()
				}
				if (params.offset) {
					firstResult params.offset.toInteger()
				}
			}
			kount = PayrollMaster.withCriteria (uniqueResult:true) {
				sqlRestriction "month(msbdt) = ${params.month}"
				projections {rowCount()}
			}
		} else {
			payrollList = PayrollMaster.list(params)
			kount = PayrollMaster.count()
		}
		[payrollList:payrollList, count:PayrollMaster.count(), params:params]
	}
	@AuthorizeOperation( level='4', text='List workforce analysis' )
	def workforceAnalysis = {
		params.max = params.max?:5000
		if (params.pdf || params.excel) {
			params.max = null
			params.offset = null
		}
		if (params.excel) {
			response.setContentType("application/excel")
			response.setHeader("Content-disposition", "attachment; filename=WorkforceAnalysis.xls")
		}
		def list = JobClassDesc.withCriteria() {
			projections {
				groupProperty('dept')
				rowCount()
			}
		}
		[deptList:list, count:PayrollMaster.count()]
	}
	@AuthorizeOperation( level='4', text='List workforce analysis by job class' )
	def workforceAnalysisByJobClass = {
		params.max = params.max?:10
		if (params.pdf || params.excel) {
			params.max = null
			params.offset = null
		}
		if (params.excel) {
			response.setContentType("application/excel")
			response.setHeader("Content-disposition", "attachment; filename=WorkforceAnalysisByJobClass.xls")
		}
		[payrollList:JobClassDesc.list(params), count:PayrollMaster.count()]
	}
	@AuthorizeOperation( level='4', text='List hire dates' )
	def hireDateList = {
		params.max = params.max?:10
		if (params.pdf || params.excel) {
			params.max = null
			params.offset = null
		}
		if (params.excel) {
			response.setContentType("application/excel")
			response.setHeader("Content-disposition", "attachment; filename=WorkforceAnalysisByJobClass.xls")
		}
		[payrollList:PayrollMaster.list(params), count:PayrollMaster.count()]
	}
	def ozarks2 = {
		params.max = params.max?:10
		if (params.pdf || params.excel) {
			params.max = null
			params.offset = null
		}
		if (params.excel) {
			response.setContentType("application/excel")
			response.setHeader("Content-disposition", "attachment; filename=Ozarks2.xls")
		}
		[payrollList:PayrollMaster.list(params), count:PayrollMaster.count()]
	}
	def ozarks3 = {
		params.max = params.max?:10
		if (params.pdf || params.excel) {
			params.max = null
			params.offset = null
		}
		if (params.excel) {
			response.setContentType("application/excel")
			response.setHeader("Content-disposition", "attachment; filename=Ozarks3.xls")
		}
		[payrollList:PayrollMaster.list(params), count:PayrollMaster.count()]
	}
	def sampleWhereQuery = {
		def list = EmployeePayrollMaster.withCriteria() {
			projections {
				groupProperty('race')
				groupProperty('sex')
				rowCount()
			}
		}
		println "second crit with groups:"
		list.each {println it}
		[x:list]
	}
}
