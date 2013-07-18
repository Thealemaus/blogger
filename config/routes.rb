Blogger::Application.routes.draw do
	root "articles#index"
  resources :articles
end
