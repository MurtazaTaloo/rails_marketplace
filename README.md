

R7: Identification of the problem you are trying to solve by building this particular marketplace app.


I am building this marketplace to let people buy and sell second hand clothes. Upon searching I didn't come across any marketplace which is purely dedicated to dealing in second hand clothes even though it is a multi billion dollar market. Ideally such a marketplace should deal in used clothes for all ages but to start with this matketplace would only deal with clothes for kids as they quickly grow out of their clothes and need new clothes.




R8: Why is it a problem that needs solving?

We are living in times of excessive consumerism at the cost of our home which we all call planet earth. Climate change is real???. But not many people are doing much about it. We are producing more consumer goods than ever did. So far we have been accusing big businesses and corporations so employ environmentally friendly production paractises which has shown no improvment. I think we should be focussing on the other end of this spectrum which is equally responsible for this issue which is consumers. 
We should focus all the resources to create awareness in people about this deadly climate change and the things causing it. This is a small effort towards encouraging people to reduce thier carbon footprint by trading thier clothes on a market place which only deals in used clothes.



R11: Description of your marketplace app (website), including:
- Purpose
- Functionality / features
- Sitemap
- Screenshots
- Target audience
- Tech stack (e.g. html, css, deployment platform, etc)

PURPOSE
As mentioned above the purpose of this application is to provide a market place for the people to buy and sell second hand clothes. So potentially  you just pay for the postage and trade your clothes for different clothes.

FUNCTIONALITY/FEATURES
- User can inspect all the available listings for sale
- User can sign up for and new account
- User can login with their existing account
- User can inspect the details of individial listings
- User can buy the listings
- User can rate the other users they have bought the items from
- User can access his personalised profile page where he can see a lot of useful information like 
    - His rating
    - Total number of listings sold
    - Totoal number of listings purchased
    - Total revenue made in $ amount
    - Current listings
    - Sold listings
    - Purchased listings.
- User can create a new listing to sell (2 types of listings) with the capability to upload pictures
    - can create a listing to sell individual dress
    - can create a listing to sell a bundle of clothes
- User can edit their listings
- User can delete their listings    

TARGET AUDIENCE
For this particular industry the target market would be mothers with children.

TECH STACK
- Ruby on Rails
- HTML
- CSS
- Bootstrap
- Ruby on rails
- Heroku for deployment
- Amazon S3 for saving pictures

USER STORIES

As Buyer:
- I want to be able to look at whats availbale in market before I have to sign up so I don't waste my time.
- I want a simple sign up process so I don't have to provide unnecessary details.
- I would like to see the pictures of the products before I buy them to avoid surprises when I receive products.
- I want to see the rating score of sellers on the platform so I can make a good buying decision.
- I want to be able to rate the sellers of my products so I can provide a quick feedback about my experience.
- I want to see all my purchases in one place so I can keep the record of all the things I have bought.

As Seller:
- I want a quick sign up process with minimum details required to get me started on the platform.
- I would like to able to track and manage all my activities from one page so I don't waste time looking for important stuff.
- I would like to be able to sell an individual dress or a bundle/bag of dresses.
- I would like to see my current itmes for sale, the items I have sold and the items I have purchased so I can have a record of my acitivy on the platform.
- I want to quickly see my total earnings in $ amount so I know how much I am benefiting by using this platform.
- 


R15 Explain the different high-level components (abstractions) in your app

Rails is full of features that hide compexity of code by doing a lot of important stuff in the background. Few high-level abstraction I used in building this app are as follows:
* **Form helper** makes the code look cleaner as there is less typing compared to regular html. It helped me with the following thigs:
    - bind form the model object to the form.
    - created form fields like text_field, text_area, file_field
    - made selection boxes

* **Resource routing** made life a lot easier by providing 7 different routes and mapping them to different HTTP verbs. 

Typing 
```
resources :listings
```

Provided the following: 
```
get 'listings' => 'listings#index'
get 'listings/new' => 'listings#new'
post 'listings' => 'listings#create'
get 'listings/:id' => 'listings#show'
get 'listings/:id/edit' => 'listings#edit'
patch 'listings/:id' => 'listings#update'
delete 'listings/:id' => listings#destroy
```
Using resourceful routing also provided me with the path and url helpers which are a lot easier to type and read.

* **Active record** which is the object relational mapping for Rails helped me with:
    - Performing database operation like creating, editing , deleting and showing records  with using any databsae language.
    - Representing relationships between different models
    - Validating data before it gets stored in database

* **Devise User** creates a model with a lot of functinality. I created a User model with devise which allows a user on this platform to:
    - Register, edit and delete their account.
    - Login and logout of the account.
    - Reset password if forgotten.
It also provides helper methods like **current_user** where the attributes of a logged in user can be accessed throughout the application. Another useful helper method I used is **authenticate_user!** which blocks access to certain pages if the user isn't logged in.    


R16 	Detail any third party services that your app will use

Amazon S3 bucket:
It is a cloud storage solution provided by AWS (Amazon Web Services). I have used it to store all the images which will be uploaded by users for thier listings.

Heroku:
Heroku is a cloud platform as a service (PaaS) which lets developers build, run and scale applications. I have used heroku to deploy my rails app as it uses Git as the primary means for deploying applications.

Github:
GitHub is a Git repository hosting service which I have used to store my rails app on. Github provides a very easy to use graphical inteface to track the progress of your project and it has a lot of other functionality including serving as a backup if you happen to lose your source files.

R17 Describe your projects models in terms of the relationships (active record associations) they have with each other

I have used the following models in my app:
1. User</br>
Where a User:

    - has_many :listings
    - has_many :transactions
    
2. Listing</br>
Where a Listing:

    - belongs_to :user
    - belongs_to :category
    - belongs_to :size
    - belongs_to :brand
    - has_many_attached :pictures

3. Brand</br>
Where a Brand:

    - has_many :listings

4. Category</br>
Where a Category:

    - has_many :listings

5. Size</br>
Where a Size:

    - has_many :listings

6. Transaction</br>
Where Transaction:
    - belongs_to :listing
    - belongs_to :user


R18	Discuss the database relations to be implemented in your application

1. User</br>
- Each user can have no or many listings.
- A user can have no or many transactions. 

2. Listing</br>
- A listing can have one or no tranactions.
- A listing must belong to only one user.
- A listing can belong to one or no category.
- A listing can belong to one or no brand.
- A listing must belong to one size.

3. Transaction</br>
- A transaction must belong to a user.
- A transaction must belong to a listing.

4. Category</br>
- A category can have no or multiple listings.

5. Brand</br>
- A brand can have no or multiple listings.

6. Size</br>
- A size can have no or multiple listings.


