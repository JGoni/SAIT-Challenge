Rails.application.routes.draw do
  # get 'candies/index'

  # get 'candies/show'

  # get 'candies/new'

  # get 'candies/edit'

  # get 'candies/delete'

  # get 'shelves/index'

  # get 'shelves/show'

  # get 'shelves/new'

  # get 'shelves/edit'

  # get 'shelves/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'candyworld#home'
  get 'candyworld/home', to:'candyworld#home'


  resources :shops do 
	 member do 
		get :delete
	 end
		
	end
  
  resources :shelves do 
    member do 
      get :delete
    end   
  end
  resources :candies do 
    member do 
      get :delete
    end
  end
  
end
  
	



