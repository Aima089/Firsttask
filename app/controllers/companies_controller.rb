# app/controllers/companies_controller.rb
class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

    def index
      @companies = Company.all
      @company = @companies.first
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
    def destroy
      @company.destroy
      redirect_to companies_path, notice: 'User was successfully destroyed.'
    end
    
    private
    def set_company
      @company = Company.find(params[:id])
    end
    
    def company_params
      params.require(:company).permit(:name, :date)
    end
end