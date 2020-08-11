Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
    resources :books
    resources :spells
    
    get 'spells/:id/confirm_delete', to: 'spells#confirm_delete', as: 'confirm_delete_spell'
    get 'books/:id/confirm_delete', to: 'books#confirm_delete', as: 'confirm_delete_book'
    get 'spells/:id/add_to_book', to: 'spells#add_to_book', as: 'add_to_book_spell'
end
