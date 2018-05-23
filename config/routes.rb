Rails.application.routes.draw do
  	resources :categories ,only: [:index, :show]
	resources :posts
	root 'posts#index'
end
