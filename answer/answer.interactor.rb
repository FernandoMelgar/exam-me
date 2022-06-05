require_relative 'answer'

class AnswerInteractor

  def initialize(answer_gateway)
    @answer_gateway = answer_gateway
  end

  def answer(id)
    @answer_gateway.by_id(id)
  end

  def by_question_id(question_id)
    @answer_gateway.answers.filter { |it| it.question_id == question_id }
  end

  def correct_answers_by_question_id(question_id)
    @answer_gateway.answers.filter { |it| it.question_id == question_id && it.is_correct == true }
  end

  def wrong_answers_by_question_id(question_id)
    @answer_gateway.answers.filter { |it| it.question_id == question_id && it.is_correct == false }
  end
end
