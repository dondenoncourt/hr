package daffron.fms.hr.recruiting


import grails.util.Environment


class FileService {
	def grailsApplication
    List<File> getOfferLetterAttachments() {
		def prefix = Environment.current.name
		if ([Environment.TEST.name, Environment.DEVELOPMENT.name].find{it == prefix}) {
			prefix = 'DAFFRON'
		}
		List<File> attachments = []
		new File(getRootPath()+"/media").eachFileMatch(~/${prefix}.*/){file ->
			attachments << file
		}
		attachments
    }
	String getRootPath() {
		grailsApplication.parentContext.getServletContext().getRealPath("/")
	}

}
