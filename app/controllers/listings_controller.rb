class ListingsController < ApplicationController
  # before_action :listing_params
  def index
    @listings = Listing.all
    @is_sold = params[:sold_status]
    # if @is_sold == "true"
    #   @is_sold = true
    # else
    #   @is_sold = false
    # end
  end

  def new
    @listing = Listing.new
    @bundle = params[:bundle]
    if @bundle == "true"
      @bundle = true
    else
      @bundle = false
    end
  end

  def create
    @listing = current_user.listings.create(listing_params)
    # render listing_path
  end

  def update
    @listing = Listing.find(params[:id])
    if params["sold_status"]
      @listing.sold_status = true
      @listing.save
    else
      @listing.update(listing_params)
    end 
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def delete
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def type_selection
    
  end
  
  

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :category_id, :brand_id, :size_id, pictures: [])
  end
end
