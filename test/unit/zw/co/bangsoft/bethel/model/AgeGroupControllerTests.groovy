package zw.co.bangsoft.bethel.model



import org.junit.*
import grails.test.mixin.*

@TestFor(AgeGroupController)
@Mock(AgeGroup)
class AgeGroupControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ageGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ageGroupInstanceList.size() == 0
        assert model.ageGroupInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ageGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ageGroupInstance != null
        assert view == '/ageGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ageGroup/show/1'
        assert controller.flash.message != null
        assert AgeGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ageGroup/list'


        populateValidParams(params)
        def ageGroup = new AgeGroup(params)

        assert ageGroup.save() != null

        params.id = ageGroup.id

        def model = controller.show()

        assert model.ageGroupInstance == ageGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ageGroup/list'


        populateValidParams(params)
        def ageGroup = new AgeGroup(params)

        assert ageGroup.save() != null

        params.id = ageGroup.id

        def model = controller.edit()

        assert model.ageGroupInstance == ageGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ageGroup/list'

        response.reset()


        populateValidParams(params)
        def ageGroup = new AgeGroup(params)

        assert ageGroup.save() != null

        // test invalid parameters in update
        params.id = ageGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ageGroup/edit"
        assert model.ageGroupInstance != null

        ageGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ageGroup/show/$ageGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ageGroup.clearErrors()

        populateValidParams(params)
        params.id = ageGroup.id
        params.version = -1
        controller.update()

        assert view == "/ageGroup/edit"
        assert model.ageGroupInstance != null
        assert model.ageGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ageGroup/list'

        response.reset()

        populateValidParams(params)
        def ageGroup = new AgeGroup(params)

        assert ageGroup.save() != null
        assert AgeGroup.count() == 1

        params.id = ageGroup.id

        controller.delete()

        assert AgeGroup.count() == 0
        assert AgeGroup.get(ageGroup.id) == null
        assert response.redirectedUrl == '/ageGroup/list'
    }
}
