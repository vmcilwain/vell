Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  # Requires an application restart everytime a new page is added.
   Dir.glob('app/views/ui/*.html.haml').sort.each do |file|
     action = File.basename(file,'.html.haml')
     get "ui/#{action}", controller: 'ui', action: action
   end

  get 'blog_tags/:tag', to: 'blogs#index', as: :blog_tag
  get 'about', to: 'home#about'
  root to: 'home#index'

  resources :contact_mes, only: [:index, :new, :show, :create]
  resources :blogs, :blog_comments, :projects

  resources :home, only: [:index] do
    collection do
      get :about
    end
  end

  resources :blog_files, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :download
    end
  end
end
