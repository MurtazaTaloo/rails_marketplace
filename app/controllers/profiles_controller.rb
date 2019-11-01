class ProfilesController < ApplicationController
  
  def user_profile
    # @transactions = current_user.transactions
    @current_listings = current_user.listings.map do |l|
      if l.sold_status == nil
        l
      end
    end

    @purchases = current_user.transactions.map do |transaction|
      transaction.listing
    end

    @sold_listings = current_user.listings.map do |l|
      if l.sold_status == true
        l
      end
    end

    @sales = @sold_listings.map do |listing|
      if listing.price != nil
        return listing.price
      end
    end
    


  end

end


