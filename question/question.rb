# Model representation of a Question
class Question
  def initialize(id, question, answers)
    @id = id
    @question = question
    @answers = answers
  end

  def to_json(*_args)
    { id: @id, title: @title, answers: @answers.map { |a| a.to_json } }.to_json
  end

  attr_reader :id, :title
end

class Answer
  def initialize(id, text, correct)
    @id = id
    @text = text
    @correct = correct
  end

  def to_json(*_args)
    { id: @id, text: @text, correct: @correct }.to_json
  end
end
