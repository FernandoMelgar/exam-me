require 'singleton'
# In memory implementation of QuestionGateway
class QuestionInMemoryGateway
  include Singleton

  def initialize
    @questions = [Question.new(1, "Question 1"), Question.new(2, "Question 2"), Question.new(3, "Question 3")]
  end

  attr_reader :questions

  def save(question)
    @questions.push(question)
  end

  def by_id(id)
    @questions.filter { |it| it.id == id}
  end
end
