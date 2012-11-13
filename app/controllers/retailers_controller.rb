class RetailersController < ApplicationController
  
  before_filter :require_manager, :except => [:index, :show]
  before_filter :find_retailer, :only => [:show, :edit, :update, :destroy]
  after_filter :set_user_retailer, :only => :create

  def index
    @retailers = Retailer.all
  end

  def new
    @retailer = Retailer.new
    1.times { @retailer.locations.build }
  end

  def create
    @retailer = Retailer.new(params[:retailer])
    @retailer.created_by_user = current_user.id
    if @retailer.save
       redirect_to retailer_path(@retailer)
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @retailer.update_attributes params[:retailer]
      redirect_to @retailer
    else
      render "edit"
    end
  end


  def show
  end

  def destroy
    if @retailer.destroy
      redirect_to root_path
    end
  end

  private
  
  def find_retailer
    @retailer = Retailer.find(params[:id])
  end

  def set_user_retailer
    @user = current_user
    @user.retailer_id = @retailer.id
    @user.save
  end
end
