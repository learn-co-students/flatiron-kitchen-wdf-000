FlatironKitchen::Application.routes.draw do
  resources :recipes

  resources :recipe_ingredients

  resources :ingredients

end
