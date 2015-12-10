Rails.application.routes.draw do
  get 'messages/new'

  get 'messages/create'

  root to: 'home#index'

end
