Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  root to: "dashboard#index"
end
