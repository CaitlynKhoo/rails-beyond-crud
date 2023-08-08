Rails.application.routes.draw do
  resources :restaurants do
    # Addition routes that relate to restuarants go here:
    resources :reviews, only: [:new, :create]
    collection do
      # Custom index
      # /restaurants/whatever_word_you_say
      get :top
      # get :worst
    end

    member do
      # Customer show
      # /restaurants/:id/whatever_word_you_say
      get :chef
    end
  end
  resources :reviews, only: [:show, :edit, :update, :destroy]
end
