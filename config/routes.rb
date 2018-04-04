Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: "dashboard#index"
end
