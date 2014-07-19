import java.awt.Dimension
import java.awt.RenderingHints
import java.awt.image.BufferedImage

import javax.imageio.ImageIO

import net.sf.ehcache.*
import net.sf.ehcache.store.*

import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.xhtmlrenderer.pdf.ITextRenderer
import org.xhtmlrenderer.simple.Graphics2DRenderer
import org.xhtmlrenderer.util.DownscaleQuality
import org.xhtmlrenderer.util.FSImageWriter
import org.xhtmlrenderer.util.ImageUtil
import org.xhtmlrenderer.util.ScalingOptions

/**

A Simple fetcher to turn a specific URL into a PDF. 

*/

class PdfService {

	def grailsApplication
    boolean transactional = false

	byte[] buildPdf(url) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        ITextRenderer renderer = new ITextRenderer();
        renderer.setDocument(url);
        renderer.layout();
        renderer.createPDF(baos);
        byte[] b = baos.toByteArray();
        return b

    }
	def thumbnail(String address, String imageName, String userId) {
		println "thumbnail for $imageName created with JTidy"
		String rootPath = grailsApplication.parentContext.getServletContext().getRealPath("/")
		File checkIfFile = new File("${rootPath}/images/transient/${imageName}.png")
		if (checkIfFile.exists()) {
			println "${rootPath}/transient/${imageName}.png thumbnail already exists -- not building"
			return
		}
		if (address =~ /\?/) {
			address += "&pdf=true"
		} else {
			address += "?pdf=true"
		}
		address += "&userId=$userId"
		log.debug "Fetching url: $address"
		def tidy = new org.w3c.tidy.Tidy()
		tidy.with {
			setQuiet(true)
			setXHTML(true)
			setHideComments(true)
			setInputEncoding("UTF-8")
			setOutputEncoding("UTF-8")
			setShowErrors(10)
			setShowWarnings(false)
		}
	 
		def url = new URL(address)
		def doc = tidy.parseDOM(new ByteArrayInputStream(url.text.replaceAll(/\x1a/, '').getBytes("UTF-8")), null)
		def os = new FileOutputStream("${rootPath}/images/transient/${imageName}.png")
	 
		def buf = new BufferedImage(240, 180, BufferedImage.TYPE_INT_RGB)
	 
		def graphics = buf.createGraphics()
		def renderer = new Graphics2DRenderer()
	 
		renderer.with {
			setDocument(doc, address)
			layout(graphics, new Dimension(240, 180))
			render(graphics)
			graphics.dispose()
			ImageIO.write(buf, "png", os)
		}
		
	}

}

