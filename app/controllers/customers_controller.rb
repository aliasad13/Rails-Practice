class CustomersController < ApplicationController

	before_action :set_customer, only: [:index]


	def index
		# @order_details = @customer.try(:orders)
		@order_details = Order.all

	end


	private

	def set_customer
		@customer = Customer.find_by(id: params[:id])
	end

	def customer_params
		params.require(:customer).permit()
	end
end