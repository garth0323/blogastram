Rails.application.routes.draw do

  devise_for :users
  resources :posts do 
  	member do
  		post 'create_comment'
  	end
  end
  authenticated :user do
	  root 'posts#index', as: :authenticated_root
	end
	unauthenticated :user do
	  root 'pages#landing', as: :unauthenticated_root
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
