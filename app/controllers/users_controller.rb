class UsersController < ApplicationController
  before_action :set_company, only: [:new, :create, :index]

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @company = @user.company 
  end

  def new
    @user = @company.users.new
  end
  def create
    @user = @company.users.new(user_params)

    if @user.save
      redirect_to company_user_path(@company, @user), notice: 'User was successfully created.'
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
end