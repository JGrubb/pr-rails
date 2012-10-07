class RetailersController < ApplicationController
  def index
  end

  def new
    @retailer = Retailer.new
  end

  def create
    @retailer = Retailer.new(params[:retailer])
    if @retailer.save!
      redirect_to retailer_path(@retailer)
    end
  end

  def edit
    @retailer = Retailer.find(params[:id])
  end

  def update
    @retailer = Retailer.find(params[:id])
    if @retailer.update_attributes params[:retailer]
      redirect_to @retailer
    end
  end

  def show
  end

  def destroy
  end
end
