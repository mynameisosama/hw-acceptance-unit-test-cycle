Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'similar_movies/:title' => 'movies#similar_movies', as: :movie_similar_movies
  # match "/movies/similar_movies" => "movies#similar_movies", :as => :movie_similar_movies, via: :get
end
