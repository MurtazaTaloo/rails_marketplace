class ListingsController < ApplicationController
  # before_action :listing_params
  def index
    @listings = Listing.all
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
    render listing_path
  end
  

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
  end

  def delete
  end

  def type_selection
    
  end
  
  

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :category_id, :brand_id, :size_id, pictures: [])
  end
end
