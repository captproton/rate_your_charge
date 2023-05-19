# Below are the routes for madmin
namespace :madmin do
  resources :benefits
  resources :services
  resources :announcements
  resources :users
  namespace :active_storage do
    resources :variant_records
  end
  namespace :active_storage do
    resources :blobs
  end
  namespace :active_storage do
    resources :attachments
  end
  root to: "dashboard#show"
end
