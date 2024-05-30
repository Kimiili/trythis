Rails.application.routes.draw do
  devise_for :users
  get 'songs/hourock' => 'songs#hourock'
  get 'songs/kpop' => 'songs#kpop'
  get 'songs/yougakupop' => 'songs#yougakupop'
  get 'songs/yougakurock' => 'songs#yougakurock'
  get 'songs/anison' => 'songs#anison'
  get 'songs/classic' => 'songs#classic'
  get 'songs/hiphop' => 'songs#hiphop'
  get 'songs/randb' => 'songs#randb'
  get 'songs/jpop' => 'songs#jpop'
  get 'songs/vocaloid' => 'songs#vocaloid'
  get 'songs/search' => 'songs#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  get 'songs/:song_id/likes' => 'likes#create'
  get 'songs/:song_id/likes/:id' => 'likes#destroy'
  resources :songs

  resources :songs do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  resources :perfumes

  root 'songs#index'
end
