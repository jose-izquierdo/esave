class InvoicesController < ApplicationController
  # GET /invoices
  def index
    @invoices = current_user.invoices
    render json: @invoices
  end

  # POST /invoices
  def create
    @invoice = current_user.invoices.new(invoice_params)

    if @invoice.save
      render json: @invoice, status: :created
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  private

  def invoice_params
    params.require(:invoice)
        	.permit(
						:price, 
						:date,
						:due_date,
						:initial_period_date,
						:end_period_date,
						:tax_rate,
						:concept,
						:invoice_number,
						:payment_status,
						:payment_method,
						:price,
						:total_price,
						:due_date,
						:supplier_id, 
					)
  end
end
