package daffron.fms.hr.recruiting



import org.junit.*
import grails.test.mixin.*

@TestFor(CompensationTeamController)
@Mock(CompensationTeam)
class CompensationTeamControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/compensationTeam/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.compensationTeamInstanceList.size() == 0
        assert model.compensationTeamInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.compensationTeamInstance != null
    }

    void testSave() {
        controller.save()

        assert model.compensationTeamInstance != null
        assert view == '/compensationTeam/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/compensationTeam/show/1'
        assert controller.flash.message != null
        assert CompensationTeam.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/compensationTeam/list'


        populateValidParams(params)
        def compensationTeam = new CompensationTeam(params)

        assert compensationTeam.save() != null

        params.id = compensationTeam.id

        def model = controller.show()

        assert model.compensationTeamInstance == compensationTeam
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/compensationTeam/list'


        populateValidParams(params)
        def compensationTeam = new CompensationTeam(params)

        assert compensationTeam.save() != null

        params.id = compensationTeam.id

        def model = controller.edit()

        assert model.compensationTeamInstance == compensationTeam
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/compensationTeam/list'

        response.reset()


        populateValidParams(params)
        def compensationTeam = new CompensationTeam(params)

        assert compensationTeam.save() != null

        // test invalid parameters in update
        params.id = compensationTeam.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/compensationTeam/edit"
        assert model.compensationTeamInstance != null

        compensationTeam.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/compensationTeam/show/$compensationTeam.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        compensationTeam.clearErrors()

        populateValidParams(params)
        params.id = compensationTeam.id
        params.version = -1
        controller.update()

        assert view == "/compensationTeam/edit"
        assert model.compensationTeamInstance != null
        assert model.compensationTeamInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/compensationTeam/list'

        response.reset()

        populateValidParams(params)
        def compensationTeam = new CompensationTeam(params)

        assert compensationTeam.save() != null
        assert CompensationTeam.count() == 1

        params.id = compensationTeam.id

        controller.delete()

        assert CompensationTeam.count() == 0
        assert CompensationTeam.get(compensationTeam.id) == null
        assert response.redirectedUrl == '/compensationTeam/list'
    }
}
