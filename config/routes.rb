Rails.application.routes.draw do
  get "/", to: "dashboard#index", as: "root"
  get "/songs/tag_cloud", as: "songs_tag_cloud"
  resources :songs
  get "/dashboard", to: "dashboard#index", as: "dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
