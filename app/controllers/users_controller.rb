class UsersController < ApplicationController

  before_filter :authorize_admin!
  before_filter :find_user, only: [:show, :edit, :update]

  def index
    @users = User.order("last_name ASC").paginate(page: params[:id])
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def admins
    @users = User.where(:admin => true)
    render :index
  end

  def managers
    @users = User.of_role(User::ROLE_OPTIONS[0])
    render :index
  end

  def employees
    @users = User.of_role(User::ROLE_OPTIONS[1])
    render :index
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
