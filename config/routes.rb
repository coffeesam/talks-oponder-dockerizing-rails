Rails.application.routes.draw do
  resources :leads
  root 'leads#new'
end
