class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :new, :create, :destroy, :edit, :update, :search]

  def index
    @users = @company.users
  end
  def search
    @users = @company.users.where("name LIKE ?", "%#{params[:query]}%")
    render :index

  end
  
    def show
      @user = User.find(params[:id])
      @company = @user.company

    end


  def new
    @user = @company.users.build

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
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to company_users_path(@user.company), notice: 'User was successfully destroyed.'
    else
      # Handle error
    end
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