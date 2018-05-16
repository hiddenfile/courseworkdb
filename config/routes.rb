Rails.application.routes.draw do
  devise_for :employees, ActiveAdmin::Devise.config
  devise_for :admins, ActiveAdmin::Devise.config.merge(:path => :employees)

  ActiveAdmin.routes(self)
  root to: "dashboard#index"
end
