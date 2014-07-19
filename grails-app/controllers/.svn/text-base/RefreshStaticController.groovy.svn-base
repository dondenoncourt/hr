

class RefreshStaticController {

    def grailsResourceProcessor

	def refresh = {

       /* IMPORTANT STUFF */
       grailsResourceProcessor.modulesByName.each{ entry->
		   println entry.dump()
           entry.value.resources*.originalLastMod = System.currentTimeMillis()
       }
       grailsResourceProcessor.reloadChangedFiles()
        /* END OF IMPORTANT STUFF */

       render 'resources refreshed!'
	}

}

