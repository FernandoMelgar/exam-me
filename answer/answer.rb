# Class Answer, has a many to one relationship with questions.
class Answer
  attr_reader :id, :question_id, :title, :is_correct

  def initialize(id, question_id, title, is_correct)
    @id = id
    @question_id = question_id
    @title = title
    @is_correct = is_correct
  end

  def to_json(*_args)
    { id: @id, questionId: @question_id, title: @title, isCorrect: @is_correct }.to_json
  end

end
