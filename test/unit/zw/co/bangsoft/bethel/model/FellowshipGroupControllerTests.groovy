package zw.co.bangsoft.bethel.model



import org.junit.*
import grails.test.mixin.*

@TestFor(FellowshipGroupController)
@Mock(FellowshipGroup)
class FellowshipGroupControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fellowshipGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fellowshipGroupInstanceList.size() == 0
        assert model.fellowshipGroupInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.fellowshipGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fellowshipGroupInstance != null
        assert view == '/fellowshipGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fellowshipGroup/show/1'
        assert controller.flash.message != null
        assert FellowshipGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fellowshipGroup/list'


        populateValidParams(params)
        def fellowshipGroup = new FellowshipGroup(params)

        assert fellowshipGroup.save() != null

        params.id = fellowshipGroup.id

        def model = controller.show()

        assert model.fellowshipGroupInstance == fellowshipGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fellowshipGroup/list'


        populateValidParams(params)
        def fellowshipGroup = new FellowshipGroup(params)

        assert fellowshipGroup.save() != null

        params.id = fellowshipGroup.id

        def model = controller.edit()

        assert model.fellowshipGroupInstance == fellowshipGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fellowshipGroup/list'

        response.reset()


        populateValidParams(params)
        def fellowshipGroup = new FellowshipGroup(params)

        assert fellowshipGroup.save() != null

        // test invalid parameters in update
        params.id = fellowshipGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fellowshipGroup/edit"
        assert model.fellowshipGroupInstance != null

        fellowshipGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fellowshipGroup/show/$fellowshipGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fellowshipGroup.clearErrors()

        populateValidParams(params)
        params.id = fellowshipGroup.id
        params.version = -1
        controller.update()

        assert view == "/fellowshipGroup/edit"
        assert model.fellowshipGroupInstance != null
        assert model.fellowshipGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fellowshipGroup/list'

        response.reset()

        populateValidParams(params)
        def fellowshipGroup = new FellowshipGroup(params)

        assert fellowshipGroup.save() != null
        assert FellowshipGroup.count() == 1

        params.id = fellowshipGroup.id

        controller.delete()

        assert FellowshipGroup.count() == 0
        assert FellowshipGroup.get(fellowshipGroup.id) == null
        assert response.redirectedUrl == '/fellowshipGroup/list'
    }
}
