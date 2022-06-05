require 'sinatra'
require_relative 'question/question'
require_relative 'question/question.intereactor'
require_relative 'answer/answer.interactor'
require_relative 'answer/answer.inmemory.gateway'
require_relative 'score/score.interactor'
require_relative 'score/score'
require_relative 'score/score.inmemory.gateway'

question_interactor = QuestionInteractor.new(QuestionInMemoryGateway.instance)
answer_interactor = AnswerInteractor.new(AnswerInMemoryGateway.instance)
score_interactor = ScoreInteractor.new(ScoreInMemoryGateway.instance)

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

get '/questions/random/:n/withAnswers' do

end
get '/answers/:id' do
  content_type :json
  answer_interactor.answer(params['id'].to_i).to_json
end

get '/questions/:id/answers' do
  is_correct = params[:isCorrect]
  if is_correct.nil?
    return answer_interactor.by_question_id(params['id'].to_i)
  elsif is_correct == true
    return answer_interactor.correct_answers_by_question_id(params['id'].to_i).to_json
  else
    return answer_interactor.wrong_answers_by_question_id(params['id'].to_i).to_json
  end
end

post '/scores' do
  content_type :json
  body = JSON.parse(request.body.read)
  score_interactor.save(Score.new(-1, body['username'], body['score'].to_i, Time.new.inspect, body['numOfQuestions'].to_i)).to_json
end

get '/scores' do
  content_type :json
  order_by = params[:orderBy]
  if order_by.nil?
    score_interactor.all.to_json
  elsif order_by == 'desc'
    score_interactor.all_order_desc.to_json
  elsif order_by == 'asc'
    score_interactor.all_order_asc.to_json
  else
    status 400
    return { error: "Unidentified symbol #{order_by}, correct usage: /scores?orderBy=asc|desc" }.to_json
  end
end
