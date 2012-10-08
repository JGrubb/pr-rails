class RetailersController < ApplicationController
  def index
    @retailers = Retailer.includes(:user).all
  end

  def new
    @retailer = Retailer.new
  end

  def create
    @retailer = Retailer.new(params[:retailer])
    @retailer.user_id = current_user.id
    if @retailer.save!
      redirect_to retailer_path(@retailer)
    else
      render "new"
    end
  end

  def edit
    @retailer = Retailer.find(params[:id])
  end

  def update
    @retailer = Retailer.find(params[:id])
    if @retailer.update_attributes params[:retailer]
      redirect_to @retailer
    else
      render "edit"
    end
  end


  def show
    @retailer = Retailer.find(params[:id])
  end

  def destroy
    @retailer = Retailer.find(params[:id])
    if @retailer.destroy
      redirect_to root_path
    end
  end
end
