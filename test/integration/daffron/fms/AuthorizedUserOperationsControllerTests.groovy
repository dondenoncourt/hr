package daffron.fms

import daffron.fms.hr.User
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

class AuthorizedUserOperationsControllerTests extends GroovyTestCase {
	AuthorizedUserOperationsController controller 
	void setUp() {
		(55000..55400).each {opId ->
			def ao = new AuthorizedOperations(authorityOperationId:opId, controller:'Requisition', action:'list', securityLevel:4, text:'none')
			ao.id = opId
			if (!ao.save(insert:true)) {
				ao.errors.each{println it}
				assert false
			}
		}
		assert AuthorizedOperations.count() == 401
		(55000..55100).each {opId ->
			def auo = new AuthorizedUserOperations(permission:'G')
			auo.authorityOperationId = opId
			auo.userId = 'don'
			if (!auo.save(insert:true, flush:true)) {
				auo.errors.each {println it}
				assert false
			}
		}
		assert AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(55001, 'don')
		assert AuthorizedUserOperations.count() == 101
		def user = new User(fullName:'Don Denoncourt', email:'don@denoncourt.com')
		user.id = 'don'
		user.save(validate:false)
		controller = new AuthorizedUserOperationsController()
	}

    private def populateValidParams(params) {
	    assert params != null
		params.authorityOperationId = 55001
		params.userId = 'don'
		params.permission = 'G'
    }
	private def clearParams(params) {
		params.authorityOperationId = null
		params.userId = null
		params.permission = null
	}

	void testAuthOpsHR() {
		assert CH.config.xxauops.min.op.id == 55000
		assert CH.config.xxauops.max.op.id == 59999
		
		def authOps = AuthorizedOperations.findAllByAuthorityOperationIdBetween(CH.config.xxauops.min.op.id,
																	CH.config.xxauops.max.op.id,
																	[sort:'controller', order:'desc'])
		assert authOps?.size() == 401
		assert AuthorizedOperations.authorizedOperationsHR()?.size() == 401
	}
    void testIndex() {
        controller.index()
        assert "/authorizedUserOperations/list" == controller.response.redirectedUrl
    }

    void testList() {
        def model = controller.list()
        assert  model.authorizedUserOperationsInstanceList.size() == 10 // with default page size
    }

    void testCreate() {
       def model = controller.create()
       assert  model.authorizedUserOperationsInstance != null
    }

    void testSave() {
        assert AuthorizedUserOperations.count() == 101
		controller.params.authorityOperationId = 1
		controller.params.userId = 'invalid'
        def model = controller.save()
        assert controller.modelAndView.viewName == '/authorizedUserOperations/create'

        controller.response.reset()

		controller.params.authorityOperationId = 55101
		controller.params.userId = 'don'
		controller.params.permission = 'G'
        controller.save()
        assert controller.response.redirectedUrl == '/authorizedUserOperations/list'
        assert controller.flash.message != null
        assert AuthorizedUserOperations.count() == 102
    }

    void testShow() {
		controller.params.authorityOperationId = 1
		controller.params.userId = 'invalid'
        controller.show()

        assert controller.flash.message ==~ /.*not found/
        assert controller.response.redirectedUrl == '/authorizedUserOperations/list'

		controller.params.authorityOperationId = 55001
		controller.params.userId = 'don'

        def model = controller.show()
		println controller.flash.message 
        def auo = AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(55001, 'don')
		assert auo
        assert  model.authorizedUserOperationsInstance == auo
    }

    void testEdit1() {
        controller.edit()

        assert controller.flash.message ==~ /.* not found.*/
        assert controller.response.redirectedUrl == '/authorizedUserOperations/list'
    }
    void testEdit2() {
		controller = new AuthorizedUserOperationsController()
		controller.params.authorityOperationId = 55001
		controller.params.userId = 'don'
		controller.params.permission = 'G'
        def model = controller.edit()
        assert AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(55001, 'don') != null
        assert  model.authorizedUserOperationsInstance == AuthorizedUserOperations.findByAuthorityOperationIdAndUserId(55001, 'don')
    }

    void testUpdate() {
		clearParams(controller.params)
        controller.update()

        assert controller.flash.message != null
        assert controller.response.redirectedUrl == '/authorizedUserOperations/edit'

        controller.response.reset()

		controller = new AuthorizedUserOperationsController()

		controller.params.authorityOperationId = 55101
		controller.params.userId = 'don'
		controller.params.permission = 'G'
        def authorizedUserOperations = new AuthorizedUserOperations(controller.params)

        assert authorizedUserOperations.save() != null

        // test invalid parameters in update
        controller.params.id = authorizedUserOperations.id
        //TODO: add invalid values to params object

        controller.update()

//        assert controller.modelAndView.view == "/authorizedUserOperations/edit"
        assert controller.flash.message ==~ /.* updated/
		

    }

    void testDelete() {
        controller.delete()
        assert controller.flash.message != null
        assert controller.response.redirectedUrl == '/authorizedUserOperations/list'

        controller.response.reset()

		controller.params.authorityOperationId = 55101
		controller.params.userId = 'don'
		controller.params.permission = 'G'
        def authorizedUserOperations = new AuthorizedUserOperations(newEntity:true)
		authorizedUserOperations.properties = controller.params

        assert authorizedUserOperations.save() != null
        assert AuthorizedUserOperations.count() == 102

        controller.params.id = authorizedUserOperations.id

        controller.delete()

        assert AuthorizedUserOperations.count() == 101
        assert AuthorizedUserOperations.get(authorizedUserOperations.id) == null
        assert controller.response.redirectedUrl == '/authorizedUserOperations/list'
    }
}
