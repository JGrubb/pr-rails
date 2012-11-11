class RetailersController < ApplicationController
  
  before_filter :require_manager, :except => [:index, :show]
  before_filter :find_retailer, :only => [:show, :edit, :update, :destroy]

  def index
    @retailers = Retailer.includes(:user).all
  end

  def new
    @retailer = Retailer.new
    1.times { @retailer.locations.build }
  end

  def create
    @retailer = Retailer.new(params[:retailer])
    @retailer.user_id = current_user.id
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

end
