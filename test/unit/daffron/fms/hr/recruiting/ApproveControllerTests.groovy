package daffron.fms.hr.recruiting



import org.junit.*
import grails.test.mixin.*

@TestFor(ApproveController)
@Mock(Approve)
class ApproveControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/approve/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.approveInstanceList.size() == 0
        assert model.approveInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.approveInstance != null
    }

    void testSave() {
        controller.save()

        assert model.approveInstance != null
        assert view == '/approve/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/approve/show/1'
        assert controller.flash.message != null
        assert Approve.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/approve/list'


        populateValidParams(params)
        def approve = new Approve(params)

        assert approve.save() != null

        params.id = approve.id

        def model = controller.show()

        assert model.approveInstance == approve
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/approve/list'


        populateValidParams(params)
        def approve = new Approve(params)

        assert approve.save() != null

        params.id = approve.id

        def model = controller.edit()

        assert model.approveInstance == approve
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/approve/list'

        response.reset()


        populateValidParams(params)
        def approve = new Approve(params)

        assert approve.save() != null

        // test invalid parameters in update
        params.id = approve.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/approve/edit"
        assert model.approveInstance != null

        approve.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/approve/show/$approve.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        approve.clearErrors()

        populateValidParams(params)
        params.id = approve.id
        params.version = -1
        controller.update()

        assert view == "/approve/edit"
        assert model.approveInstance != null
        assert model.approveInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/approve/list'

        response.reset()

        populateValidParams(params)
        def approve = new Approve(params)

        assert approve.save() != null
        assert Approve.count() == 1

        params.id = approve.id

        controller.delete()

        assert Approve.count() == 0
        assert Approve.get(approve.id) == null
        assert response.redirectedUrl == '/approve/list'
    }
}
