Rails.application.routes.draw do
  # devise_for :users
	namespace 'api' do
		namespace 'v1' do
			resources :good_index_records
			resources :sessions, only: [:create, :destroy]
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end