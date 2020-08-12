Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :books
  resources :spells
    
  get 'spells/:id/confirm_delete', to: 'spells#confirm_delete', as: 'confirm_delete_spell'
  get 'books/:id/confirm_delete', to: 'books#confirm_delete', as: 'confirm_delete_book'
  get 'spells/:id/add_to_book', to: 'spells#add_to_book', as: 'add_to_book_spells'
  post 'spells/:id/add_to_book', to: 'spells#add' , as: 'book_id'

end



