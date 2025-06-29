Rails.application.routes.draw do
  root "home#show"
  get "home/show", to: "home#show", as: :home_show

  # 管理者
  get "admin/login", to: "admin#login", as: :admin_login
  post "admin/login", to: "admin#login_post", as: :admin_login_post
  post "admin/logout", to: "admin#logout", as: :admin_logout
  get "admin/new", to: "admin#new", as: :new_admin_post
  post "admin/create", to: "admin#create", as: :admin_create_post

  #　閲覧ページ
  get "post", to: "posts#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
