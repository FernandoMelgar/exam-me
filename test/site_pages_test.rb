require_relative 'test_helper'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
  end

  def test_question_request_is_ok
    get '/questions'
    assert last_response.ok?
  end

end