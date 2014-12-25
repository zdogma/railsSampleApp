Rails.application.routes.draw do
  get 'profile/show'

  get 'profile/edit'

  get 'profile/update'

  get "/books/:id" => "books#show"
  resources :publishers do
    resources :books

    member do
      get 'detail'
    end

    collection do
      get 'search'
    end

  end

end
