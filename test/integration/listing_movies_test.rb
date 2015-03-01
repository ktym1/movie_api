require 'test_helper'

class ListingMoviesTest < ActionDispatch::IntegrationTest
  
  setup { host! 'api.example.com'}
  
  test 'returns list of all movies' do 
    get '/movies'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns movie by id' do
    movie = Movie.create!(title: "Epiode 7", director: "Lucas", year: 1979)
    get "/movies/#{movie.id}"
    assert_equal 200, response.status
  
  movie_response = JSON.parse(response.body, symbolize_names: true)
  assert_equal movie.title, movie_response[:title]
  
  end
end