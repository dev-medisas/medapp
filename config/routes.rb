Medapp::Application.routes.draw do
  resources :patients do
    resources :stats
  end
  root :to => "patients#index"
end
