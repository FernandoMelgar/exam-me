require 'singleton'

# Answer in memory gateway
class AnswerInMemoryGateway
  include Singleton

  def initialize
    @answers = [Answer.new(1, 10, "Answer 1", true),
                Answer.new(2, 10, "Answer 2", false),
                Answer.new(3, 10, "Answer 3", false),
                Answer.new(3, 10, "Answer 4", false)]
  end

  def by_id(id)
    @answers.filter { |it| it.id == id }
  end

  def answers
    @answers
  end
end
