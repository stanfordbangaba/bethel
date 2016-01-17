package zw.co.bangsoft.bethel.model



import org.junit.*
import grails.test.mixin.*

@TestFor(AssemblyController)
@Mock(Assembly)
class AssemblyControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/assembly/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.assemblyInstanceList.size() == 0
        assert model.assemblyInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.assemblyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.assemblyInstance != null
        assert view == '/assembly/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/assembly/show/1'
        assert controller.flash.message != null
        assert Assembly.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/assembly/list'


        populateValidParams(params)
        def assembly = new Assembly(params)

        assert assembly.save() != null

        params.id = assembly.id

        def model = controller.show()

        assert model.assemblyInstance == assembly
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/assembly/list'


        populateValidParams(params)
        def assembly = new Assembly(params)

        assert assembly.save() != null

        params.id = assembly.id

        def model = controller.edit()

        assert model.assemblyInstance == assembly
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/assembly/list'

        response.reset()


        populateValidParams(params)
        def assembly = new Assembly(params)

        assert assembly.save() != null

        // test invalid parameters in update
        params.id = assembly.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/assembly/edit"
        assert model.assemblyInstance != null

        assembly.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/assembly/show/$assembly.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        assembly.clearErrors()

        populateValidParams(params)
        params.id = assembly.id
        params.version = -1
        controller.update()

        assert view == "/assembly/edit"
        assert model.assemblyInstance != null
        assert model.assemblyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/assembly/list'

        response.reset()

        populateValidParams(params)
        def assembly = new Assembly(params)

        assert assembly.save() != null
        assert Assembly.count() == 1

        params.id = assembly.id

        controller.delete()

        assert Assembly.count() == 0
        assert Assembly.get(assembly.id) == null
        assert response.redirectedUrl == '/assembly/list'
    }
}
