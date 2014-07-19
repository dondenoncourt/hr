class UrlMappings {

	static mappings = {
		"/wowOut/runApp?"{
			controller='singleSignon'
			action='wowOut'
		}
		"/FromWOW/$hrController?/$hrAction?/$id?"{
			controller='singleSignon'
			action='wowIn'
		}
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/first/$second"  {
			controller='BCBS' 
			action='list'
		}


		"/"(controller:'login', action:'login')
		
		
		"500"(view:'/error')
	}
}
