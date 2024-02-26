class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :new, :create, :destroy]

  def index
    @users = @company.users
  end
  def search

  end
  
    def show
      @user = User.find(params[:id])
      @company = @user.company

    end


  def new
    @user = User.new
  end
  def create
    @user = @company.users.new(user_params)
    @user.company_id = params[:user][:company_id] if params[:user][:company_id].present?
    if @user.save
      redirect_to company_user_path(@user.company, @user), notice: 'User was successfully created.'
    else
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
    @company = @user.company 
    

  end
  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      @company = @user.company
      redirect_to company_user_path(@company, @user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @user.destroy
    redirect_to company_users_path(@company), notice: 'User was successfully destroyed.'
  end
  private

  def set_company
     @company = Company.find(params[:company_id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
  def search_param
    params.require(:user).permit(:name)
  end
  def set_user
    @user = User.find(params[:id])
  end
  
end