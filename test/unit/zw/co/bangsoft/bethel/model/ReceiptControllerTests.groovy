package zw.co.bangsoft.bethel.model



import org.junit.*
import grails.test.mixin.*

@TestFor(ReceiptController)
@Mock(Receipt)
class ReceiptControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/receipt/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.receiptInstanceList.size() == 0
        assert model.receiptInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.receiptInstance != null
    }

    void testSave() {
        controller.save()

        assert model.receiptInstance != null
        assert view == '/receipt/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/receipt/show/1'
        assert controller.flash.message != null
        assert Receipt.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/receipt/list'


        populateValidParams(params)
        def receipt = new Receipt(params)

        assert receipt.save() != null

        params.id = receipt.id

        def model = controller.show()

        assert model.receiptInstance == receipt
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/receipt/list'


        populateValidParams(params)
        def receipt = new Receipt(params)

        assert receipt.save() != null

        params.id = receipt.id

        def model = controller.edit()

        assert model.receiptInstance == receipt
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/receipt/list'

        response.reset()


        populateValidParams(params)
        def receipt = new Receipt(params)

        assert receipt.save() != null

        // test invalid parameters in update
        params.id = receipt.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/receipt/edit"
        assert model.receiptInstance != null

        receipt.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/receipt/show/$receipt.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        receipt.clearErrors()

        populateValidParams(params)
        params.id = receipt.id
        params.version = -1
        controller.update()

        assert view == "/receipt/edit"
        assert model.receiptInstance != null
        assert model.receiptInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/receipt/list'

        response.reset()

        populateValidParams(params)
        def receipt = new Receipt(params)

        assert receipt.save() != null
        assert Receipt.count() == 1

        params.id = receipt.id

        controller.delete()

        assert Receipt.count() == 0
        assert Receipt.get(receipt.id) == null
        assert response.redirectedUrl == '/receipt/list'
    }
}
