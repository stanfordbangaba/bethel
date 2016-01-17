package zw.co.bangsoft.bethel.model



import org.junit.*
import grails.test.mixin.*

@TestFor(CellGroupController)
@Mock(CellGroup)
class CellGroupControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cellGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cellGroupInstanceList.size() == 0
        assert model.cellGroupInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.cellGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cellGroupInstance != null
        assert view == '/cellGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cellGroup/show/1'
        assert controller.flash.message != null
        assert CellGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cellGroup/list'


        populateValidParams(params)
        def cellGroup = new CellGroup(params)

        assert cellGroup.save() != null

        params.id = cellGroup.id

        def model = controller.show()

        assert model.cellGroupInstance == cellGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cellGroup/list'


        populateValidParams(params)
        def cellGroup = new CellGroup(params)

        assert cellGroup.save() != null

        params.id = cellGroup.id

        def model = controller.edit()

        assert model.cellGroupInstance == cellGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cellGroup/list'

        response.reset()


        populateValidParams(params)
        def cellGroup = new CellGroup(params)

        assert cellGroup.save() != null

        // test invalid parameters in update
        params.id = cellGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cellGroup/edit"
        assert model.cellGroupInstance != null

        cellGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cellGroup/show/$cellGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cellGroup.clearErrors()

        populateValidParams(params)
        params.id = cellGroup.id
        params.version = -1
        controller.update()

        assert view == "/cellGroup/edit"
        assert model.cellGroupInstance != null
        assert model.cellGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cellGroup/list'

        response.reset()

        populateValidParams(params)
        def cellGroup = new CellGroup(params)

        assert cellGroup.save() != null
        assert CellGroup.count() == 1

        params.id = cellGroup.id

        controller.delete()

        assert CellGroup.count() == 0
        assert CellGroup.get(cellGroup.id) == null
        assert response.redirectedUrl == '/cellGroup/list'
    }
}
