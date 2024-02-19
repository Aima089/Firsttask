# app/controllers/companies_controller.rb

class CompaniesController < ApplicationController
    before_action :set_company, only: [:index, :show]
  
    def index
      @companies = Company.all
      # Set @company based on the first company in the list
      @company = @companies.first
    end
  
    def show
      @company = Company.find(params[:id])
    end
  
    private
  
    def set_company
      # Set @company based on the first company in the list
      @company = Company.first
    end
  end
  