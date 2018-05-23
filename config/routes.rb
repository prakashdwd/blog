Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
	resources :posts
	root 'posts#index'
end
