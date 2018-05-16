Rails.application.routes.draw do
  devise_for :admins
  ActiveAdmin.routes(self)
  root to: "dashboard#index"
end
