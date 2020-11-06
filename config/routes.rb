Rails.application.routes.draw do
	namespace :api do
		resources :students, param: :name, except: [:show, :update, :delete]
		get 'student', to: 'students#show'#,:constraints => {:name => /[A-Z][A-Z][0-9]+/}
		patch 'student', to: 'students#update'
	 	put 'student', to: 'students#update'
		delete 'student', to: 'students#destroy'
	end
	root :to => "api/students#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
