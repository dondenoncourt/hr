import grails.util.Environment

import java.awt.RenderingHints;
import java.awt.image.BufferedImage

import javax.servlet.http.HttpServletResponse;

class PdfController {

    PdfService pdfService
	
	def beforeInterceptor = {
        log.debug("action: $actionName params: $params flash: $flash")
    }
    def afterInterceptor = {model ->
        log.debug("action: $actionName model: $model")
    }

    def index = {
        redirect(action: show)
    }

    def show = {
    	def baseUri = grailsApplication.config.hr.localHttp.scheme + "://" + grailsApplication.config.hr.localHttp.serverName + ":" + grailsApplication.config.hr.localHttp.serverPort  + grailsAttributes.getApplicationUri(request) 
        log.debug "BaseUri is $baseUri"

        params.url = params.url.replaceAll("-AMPERSAND-", '&')
        params.url = params.url.replaceAll("-EQUALS-", '=')
		log.debug "params.url: ${params.url}"
        def url = baseUri + params.url //.replaceFirst('&', '?')
		
		if (url =~ /\?/) {
			url += "&pdf=true"
		} else {
			url += "?pdf=true"
		}
		if (params.sort) {
			url += "&sort=${params.sort}&order=${params.order}"
		}
		
        log.debug "Fetching url $url"

        byte[] bytes = pdfService.buildPdf(url)

        response.setContentType("application/pdf")
        response.setHeader("Content-disposition", "attachment; filename=" + (params.filename ?: "document.pdf"))
        response.setContentLength(bytes.length)
        response.getOutputStream().write(bytes)

    }
}

