require 'test_helper'

class CreatingMoviesTest < ActionDispatch::IntegrationTest

  #setup { host! 'api.example.com'}
  
  test 'create movies' do
    title = "Her"
    director = "Jonze"
    year = 2014 

    post '/movies',
      { movie:
        {title: title, director: director, year: year}
      }.to_json,
      {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }  

      assert_equal 201, response.status
      assert_equal Mime::JSON, response.content_type

      movie = json(response.body)
      assert_equal movie[:title], title
      assert_equal movie[:director], director
      assert_equal movie[:year], year
  end
end