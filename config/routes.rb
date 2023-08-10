Rails.application.routes.draw do
  resources :restaurants do
    # nested the reviews inside of restaurants
    # Addition routes that relate to restuarants go here:
    resources :reviews, only: [:new, :create]
      collection do
      # Custom index
      # /restaurants/whatever_word_you_say
      get :top # top_restaurants GET /restaurants/top(.:format)
      # get :worst
      end

    member do
      # Custom show
      # /restaurants/:id/whatever_word_you_say
      get :chef
    end
  end
  resources :reviews, only: [:show, :edit, :update, :destroy]
end


# collection -> all restaurants (no id)
# member -> one resto (need id)
