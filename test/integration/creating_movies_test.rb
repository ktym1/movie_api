require 'test_helper'

class CreatingMoviesTest < ActionDispatch::IntegrationTest

  setup { host! 'api.example.com'}
  
  test 'create movies' do
    post '/movies',
      { movie:
        {title: "Her", director: "Jonze", year: 2014}
      }.to_json,
      {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }  

      assert_equal 201, response.status
      assert_equal Mime::JSON, response.content_type

      movie = json(response.body)
      assert_equal movie_url(movie[:id]), movie.location
  end
end