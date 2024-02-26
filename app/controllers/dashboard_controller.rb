class DashboardController < ApplicationController
   before_action :set_dashboard, only: [:index, :companies]
 
   def index
     @dashboards = Dashboard.all
     set_dashboard
   end
 
   def companies
     redirect_to companies_path
   end
 
   private
 
   def set_dashboard
     @dashboard = params[:id] ? Dashboard.find(params[:id]) : Dashboard.first
   end
 end
 