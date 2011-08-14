Jewellery::Application.routes.draw do

  resources :parts, :item_types do
    collection do
      put :update_attribute_on_the_spot
    end
  end
  
  resources :items do
    collection do
      put :update_attribute_on_the_spot
      get :autocomplete_part_title
      get :search
    end
  end

  resources :part_types do
    collection do
      put :update_attribute_on_the_spot
    end
  end  

  get "welcome/index", :as => 'home'
  match "about" => "welcome#about"
  match 'parts/:id/price' => 'parts#price', :as => :retrieve_part_price

  root :to => "welcome#index"

end
