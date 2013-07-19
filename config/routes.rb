Blogger::Application.routes.draw do
	root "articles#index"
	resources :articles do
		resources :comments

	end
	resources :tags
	resources :authors
	resources :author_sessions, only: [ :new, :create, :destroy ]

	match 'login'  => 'author_sessions#new', via: :get
	match 'logout' => 'author_sessions#destroy', via: :delete
end
