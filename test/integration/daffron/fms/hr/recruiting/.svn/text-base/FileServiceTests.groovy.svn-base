package daffron.fms.hr.recruiting


import grails.util.Environment

import grails.test.mixin.*
import org.junit.*

import daffron.fms.hr.recruiting.Candidate;
class FileServiceTests extends GroovyTestCase  {
	def fileService
	def grailsApplication
    void testGetOfferLetterAttachments() {
		List<File> attachments = fileService.getOfferLetterAttachments()
		assert attachments.size() == 2
		assert attachments[0].name == 'DAFFRON_benefits_highlights.docx' 
		assert attachments[1].name == 'DAFFRON_non_compete.pdf'
    }
}
