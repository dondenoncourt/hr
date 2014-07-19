import grails.util.Environment
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

import java.awt.RenderingHints;
import java.awt.image.BufferedImage

import daffron.fms.hr.recruiting.Requisition
import daffron.fms.hr.recruiting.RequisitionStatus

import javax.servlet.http.HttpServletResponse;

class FeedsController {
	
	def beforeInterceptor = {
		log.debug("action: $actionName params: $params flash: $flash")
	}
	def feeds = {
		def iPostReqList = Requisition.findAllByStatus(RequisitionStatus.get('IPOSTED'))
		
		def compNewsList = Requisition.findAllByStatus(RequisitionStatus.get('BCKGRDCHK'))
		
		def announcementsList = Requisition.findAllByStatus(RequisitionStatus.get('SUPERSIGNHIRE'))
		[iPostReqList:iPostReqList, compNewsList:compNewsList, announcementsList:announcementsList]
	}
	def read() {
		//def url = "http://www.daffron.com/feeds/rss.xml"
		def url = "http://localhost:8080/hr/feeds/rss"
		println 'The top three news items today:'
		def parsed = new XmlParser().parse(url)
		println parsed
		def items = parsed.rss.channel//.pubDate.item
		println items
		 
//		for (item in items[0..2]) {
//			println "${item.title.text()} - ${item.link.text()}"
//			println item.description.text()
//			println '-----------------------------------------------------------------'
//		}
		render items.toString()
		
	}
}

