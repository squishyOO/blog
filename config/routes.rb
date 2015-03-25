Rails.application.routes.draw do

	get '/articles' => 'articles#search'

	resources :users

	 resources :articles do
	 	resources :comments
	 end

	root 'articles#index'
end


  
   

