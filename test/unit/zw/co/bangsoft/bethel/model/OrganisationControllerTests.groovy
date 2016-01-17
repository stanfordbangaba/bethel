package zw.co.bangsoft.bethel.model



import org.junit.*
import grails.test.mixin.*

@TestFor(OrganisationController)
@Mock(Organisation)
class OrganisationControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/organisation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.organisationInstanceList.size() == 0
        assert model.organisationInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.organisationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.organisationInstance != null
        assert view == '/organisation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/organisation/show/1'
        assert controller.flash.message != null
        assert Organisation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/organisation/list'


        populateValidParams(params)
        def organisation = new Organisation(params)

        assert organisation.save() != null

        params.id = organisation.id

        def model = controller.show()

        assert model.organisationInstance == organisation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/organisation/list'


        populateValidParams(params)
        def organisation = new Organisation(params)

        assert organisation.save() != null

        params.id = organisation.id

        def model = controller.edit()

        assert model.organisationInstance == organisation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/organisation/list'

        response.reset()


        populateValidParams(params)
        def organisation = new Organisation(params)

        assert organisation.save() != null

        // test invalid parameters in update
        params.id = organisation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/organisation/edit"
        assert model.organisationInstance != null

        organisation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/organisation/show/$organisation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        organisation.clearErrors()

        populateValidParams(params)
        params.id = organisation.id
        params.version = -1
        controller.update()

        assert view == "/organisation/edit"
        assert model.organisationInstance != null
        assert model.organisationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/organisation/list'

        response.reset()

        populateValidParams(params)
        def organisation = new Organisation(params)

        assert organisation.save() != null
        assert Organisation.count() == 1

        params.id = organisation.id

        controller.delete()

        assert Organisation.count() == 0
        assert Organisation.get(organisation.id) == null
        assert response.redirectedUrl == '/organisation/list'
    }
}
