class ProfilesController < ApplicationController
  
  def user_profile
    
    @current_listings = []
    current_user.listings.each do |l|
      if l.sold_status == nil
        @current_listings << l
      end
    end

    @purchases = []
    current_user.transactions.each do |transaction|
      @purchases << transaction.listing
    end

    @sold_listings = []
    current_user.listings.each do |l|
      if l.sold_status == true
        @sold_listings << l
      end
    end
    @sales = []
    @sold_listings.each do |listing|
      if listing.price != nil
        @sales << listing.price
      end
    end
  end

  def rate_seller

  end

  def rate_score
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:listing_id])

    @user.rating_scores_array << params[:rating_scores_array]
    @user.save

    @user.rating = @user.rating_scores_array.sum / @user.rating_scores_array.length.to_f
    @user.save

    @listing.rated_status = true
    @listing.save
    
  end

end

# <ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"5eL1LZ5D/04teku+afi2DND/UsT3qdbbze6xIDNCW0DLv29aUPtUU5FBAHFGr1o9/ekdaDd9SrRR1gkizk9ffA==", "rating_score_total"=>"1", "user_id"=>"2", "commit"=>"rate", "controller"=>"profiles", "action"=>"rate_score"} permitted: false>

