class ProductsController < ApplicationController
      def index
        byebug
        # @q = Product.ransack(params[:q])
        @products = @q.result.includes(:company)
      end
end
