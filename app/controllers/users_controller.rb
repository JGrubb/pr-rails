class UsersController < ApplicationController
include Devise

  before_filter :authorize_admin!, except: :invite_staff
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
    @users = User.where(:admin => true).paginate(page: params[:page])
    render :index
  end

  def managers
    @users = User.of_role(User::ROLE_OPTIONS[0]).paginate(page: params[:page])
    render :index
  end

  def employees
    @users = User.of_role(User::ROLE_OPTIONS[1]).paginate(page: params[:page])
    render :index
  end

  def invite_staff
    @staff = User.where(:retailer_id => current_user[:retailer_id])
    @user = User.new
    @user.password = Random.rand(1000000).to_s.crypt('pr')
    @user.password_confirmation = @user.password
  end

  def create_staff
    @user = User.new(params[:user])
    @user.retailer = Retailer.find_by_created_by_user(current_user[:id])
    @user.save
    @user.reload
    @user.send_reset_password_instructions
    redirect_to :invite_staff
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
