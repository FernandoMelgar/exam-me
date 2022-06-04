require 'sinatra'
require_relative 'question/question'
require_relative 'question/question.intereactor'

question_interactor = QuestionInteractor.new(QuestionInMemoryGateway.instance)
get '/' do
  'Sayonara, world!'
end

get '/questions' do
  content_type :json
  question_interactor.all.to_json
end

get '/questions/:id' do
  id = params['id']
  question_interactor.question(id.to_i).to_json
end

post '/questions' do
  content_type :json
  body = JSON.parse(request.body.read)
  question_interactor.save(body['title'])
  question_interactor.all.to_json
end

get '/questions/random/:n' do
  content_type :json
  question_interactor.random_questions(params['n'].to_i).to_json
end