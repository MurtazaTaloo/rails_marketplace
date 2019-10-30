class ListingsController < ApplicationController
  def index
  end

  def new
    @listing = Listing.new
    @bundle = params[:bundle]
  end

  def create
    @listing = current_user.listings.create(listing_params)
    render new_listing_path
  end
  

  def show
  end

  def edit
  end

  def delete
  end

  def type_selection
    
  end
  
  

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :category_id, :brand_id, :size_id, :picture)
  end
end
