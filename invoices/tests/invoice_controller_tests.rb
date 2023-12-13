require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @invoice = invoices(:one)
    sign_in @user
  end

  test "should get index" do
    get invoices_url, as: :json
    assert_response :success

    assert_match(/application\/json/, response.content_type)

    assert_not_empty response.parsed_body
    assert_instance_of Array, response.parsed_body
    assert_equal @user.invoices.count, response.parsed_body.size
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: {
        price: @invoice.price,
        date: @invoice.date,
        due_date: @invoice.due_date,
        initial_period_date: @invoice.initial_period_date,
        end_period_date: @invoice.end_period_date,
        tax_rate: @invoice.tax_rate,
        concept: @invoice.concept,
        invoice_number: @invoice.invoice_number,
        payment_status: @invoice.payment_status,
        payment_method: @invoice.payment_method,
        total_price: @invoice.total_price,
        supplier_id: @invoice.supplier_id
      } }, as: :json
    end

    assert_response 201

    assert_match(/application\/json/, response.content_type)

    assert_instance_of Hash, response.parsed_body
    assert_equal @invoice.price, response.parsed_body['price']
    assert_equal @invoice.date, response.parsed_body['date']
    assert_equal @invoice.due_date, response.parsed_body['due_date']
    assert_equal @invoice.initial_period_date, response.parsed_body['initial_period_date']
    assert_equal @invoice.end_period_date, response.parsed_body['end_period_date']
    assert_equal @invoice.tax_rate, response.parsed_body['tax_rate']
    assert_equal @invoice.concept, response.parsed_body['concept']
    assert_equal @invoice.invoice_number, response.parsed_body['invoice_number']
    assert_equal @invoice.payment_status, response.parsed_body['payment_status']
    assert_equal @invoice.payment_method, response.parsed_body['payment_method']
    assert_equal @invoice.total_price, response.parsed_body['total_price']
    assert_equal @invoice.supplier_id, response.parsed_body['supplier_id']
  end
end
