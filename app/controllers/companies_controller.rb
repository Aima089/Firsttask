# app/controllers/companies_controller.rb

class CompaniesController < ApplicationController
  
    def index
      @companies = Company.all
      @company = @companies.first
      @q = Company.ransack(params[:q])
      @companies = @q.result.includes(:users, :products, :stocks)
    end
    def show
      @company = Company.find(params[:id])
    end
    def new
      @company = Company.new
    end
    def create
      @company = Company.new(company_params)
      if @company.save
        redirect_to @company
      else
        render :new
    end
    end
    
    private
  
    
    def company_params
      params.require(:company).permit(:name, :date)
    end
end