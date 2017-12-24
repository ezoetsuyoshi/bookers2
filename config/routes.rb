Rails.application.routes.draw do

  devise_for :users

  resources :books do

  	resources :book_comments, only: [ :create, :destroy ]

    resource :favorites, only: [ :create, :destroy ]

  end


  root'books#usersinfo'

  get '/mypage/:id' => 'books#mypage', as: "mypage"

  get '/top' => 'books#top'

  get '/usersinfo' => 'books#usersinfo', as: "usersinfo"

  get '/usershow/:id' => 'books#usershow', as: "usershow"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
