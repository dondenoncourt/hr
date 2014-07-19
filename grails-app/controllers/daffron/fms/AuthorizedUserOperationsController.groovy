package daffron.fms

import daffron.fms.hr.User 
import daffron.fms.hr.AuthorizeOperation

class AuthorizedUserOperationsController {
    def index = { redirect(action:list,params:params) }
    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']
	@AuthorizeOperation( level='9', text='List authorized operations' )
    def list = {
        if(!params.max) params.max = 10
        [ authorizedUserOperationsInstanceList: AuthorizedUserOperations.list( params ) ]
    }
	@AuthorizeOperation( level='9', text='Display authorized operations' )
    def show = {
        def authorizedUserOperationsInstance = AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(params.authorityOperationId, params.userId) 
		if (!authorizedUserOperationsInstance) {
			flash.message = "not found"
            redirect(action:list)
			return
		}
        [ authorizedUserOperationsInstance : authorizedUserOperationsInstance]
    }
	@AuthorizeOperation( level='9', text='Delete authorized operations' )
    def delete = {
    	def authorizedUserOperations = AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(params.authorityOperationId, params.userId)
        if(authorizedUserOperations) {
            authorizedUserOperations.delete()
            flash.message =  "AuthorizedUserOperations "+AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(params.authorityOperationId, params.userId) + " deleted"
            redirect(action:list)
        }  else {
            	flash.message  = "AuthorizedUserOperations not found with key:"+AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(params.authorityOperationId, params.userId)
            redirect(action:list)
        }
    }
	@AuthorizeOperation( level='9', text='Edit authorized operations' )
    def edit = {
       	def authorizedUserOperations = AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(params.authorityOperationId, params.userId)
        if(!authorizedUserOperations) {
           	flash.message  = "AuthorizedUserOperations not found with key:"+
			   	getKey(new AuthorizedUserOperations(authorityOperationId:params.authorityOperationId, userId:params.userId))
            redirect(action:list)
        }
        else {
	        return [authorizedUserOperationsInstance:authorizedUserOperations, 
					authOps:AuthorizedOperations.authorizedOperationsHR()]
        }
    }
	@AuthorizeOperation( level='9', text='Update authorized operations' )
    def update = {
    	def authorizedUserOperations = AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(params.authorityOperationId, params.userId)
        if(authorizedUserOperations) {
            authorizedUserOperations.properties = params
            if(!authorizedUserOperations.hasErrors() && authorizedUserOperations.save()) {
               	flash.message  = "AuthorizedUserOperations with key:"+AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(params.authorityOperationId, params.userId)+" updated"
                redirect(action:list)
            }  else {
                render(view:'edit',model:[authorizedUserOperationsInstance:authorizedUserOperations])
            }
        }  else {
            flash.message = "AuthorizedUserOperations not found with key:"+AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(params.authorityOperationId, params.userId)
            redirect(action:edit,id:params.id)
        }
    }
	@AuthorizeOperation( level='9', text='Create authorized operations' )
    def create = {
        def authorizedUserOperations = new AuthorizedUserOperations(newEntity:true)
        authorizedUserOperations.properties = params
        return ['authorizedUserOperationsInstance':authorizedUserOperations, 
				authOps:AuthorizedOperations.authorizedOperationsHR()]
    }
	@AuthorizeOperation( level='9', text='Save authorized operations' )
    def save = {
        def authorizedUserOperations = new AuthorizedUserOperations(newEntity:true)
		authorizedUserOperations.properties = params 
        if(!authorizedUserOperations.hasErrors() && authorizedUserOperations.save(insert:authorizedUserOperations.newEntity, flush:true) ) {
            flash.message = "${User.get(authorizedUserOperations.userId).fullName} now has ${authorizedUserOperations.permission} on ${AuthorizedOperations.findByAuthorityOperationId(authorizedUserOperations.authorityOperationId)?.uri}"  
            redirect(action:list)
            return 
        }
		authorizedUserOperations.errors.each{println it}
        render(view:'create',model:[authorizedUserOperationsInstance:authorizedUserOperations, 
									authOps:AuthorizedOperations.authorizedOperationsHR() ])        
    }
    /*
     * the following private methods were coded to handle legacy assigned keys
     * The code intermixes the use of generated unique id columns
     * It should not be necessary to understand or modify the internals of these methods
     * Note that gen'd code depends on if the id is composite 
     */
    // Return a String representation of the key
    private String getKey(def authorizedUserOperations) {
        	def key = ""
    	    // get legacy composite key as was mapped to the domain
			// this might work outside of unit testing....
	    	//AuthorizedUserOperations.mapping.getDelegate()?.mapping?.identity?.propertyNames.each { keyField ->
			['authorityOperationId','userId'].each {keyField ->
			    key += " ${keyField}:"
				key += authorizedUserOperations?."$keyField"
	    	}
	    	return key
	}
	//	AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(params.authorityOperationId, params.userId)
}
