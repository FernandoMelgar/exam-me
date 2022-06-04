require 'sinatra'
require_relative 'question'

get '/' do
  'Sayonara, world!'
end

get '/questions' do
  content_type :json
  questions = [Question.new(1, "Question 1"), Question.new(2, "Question 2")]
  questions.to_json
end

post '/questions' do
  content_type :json
  body = JSON.parse(request.body.read)
  Question.new(body['id'], body['title']).to_json
end