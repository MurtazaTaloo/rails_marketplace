class ListingsController < ApplicationController

  # this blocks access to all pages in listings cntroller except index unless the user is signed in.
  before_action :authenticate_user!,except: :index
  
  def index
    @listings = Listing.all
    # @is_sold = params[:sold_status]
  end

  def new
    @listing = Listing.new

    # if user choses to list a bundle of drsses then @bundle stores ture and user is served the form for creating a bundle listing
    @bundle = params[:bundle]
    if @bundle == "true"
      @bundle = true
    else
      @bundle = false
    end
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing.id)
    else
      render :new
    end
  end

  
  def show
    @listing = Listing.find(params[:id])
  end
  
  def edit
    # only allows user to access the edit page of his own listings
    if current_user.id == Listing.find(params[:id]).user.id
      @listing = Listing.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    # executes "if" if coming from buy page and executes "else" if coming from edit page
    @listing = Listing.find(params[:id])
    if params["sold_status"]
      # sold_status of the chosen listing is turns to true and transaction is created for the bought listing.
      @listing.sold_status = true
      @listing.save
      Transaction.create(user_id: current_user.id, listing_id: @listing.id)
      if @listing.save
        redirect_to listings_path
      else
        redirect_to edit_listing_path
      end
    else
      @listing.update(listing_params)
      redirect_to listings_path 
    end
  end

  def delete
  end

  def destroy
    @listing = Listing.find(params[:id])
    if current_user.id == Listing.find(params[:id]).user.id
      @listing.destroy
      redirect_to profiles_user_profile_path
    else 
      redirect_to root_path
    end
  end

  def type_selection
    #lets a user chose the type of listing they want to create.
  end
  
  

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :category_id, :brand_id, :size_id, pictures: [])
  end
end
