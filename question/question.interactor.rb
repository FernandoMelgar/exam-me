require_relative 'question.inmemory.gateway'
# Question Interactor Pattern / Logic view is here
class QuestionInteractor

  def initialize(question_gateway)
    @question_gateway = question_gateway
  end

  def all
    @question_gateway.questions
  end

  def save(title)
    @question_gateway.save(Question.new(100, title))
  end

  def question(id)
    @question_gateway.by_id(id)
  end

  def random_questions(n)
    @question_gateway.questions.sample(n)
  end
end