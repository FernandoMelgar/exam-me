# Saves scores of questions solved
class Score

  attr_reader :id, :username, :score, :created, :num_of_questions

  def initialize(id, username, score, created, num_of_questions)
    @id = id
    @username = username
    @score = score
    @created = created
    @num_of_questions = num_of_questions
  end

  def to_json(*_args)
    { id: @id, username: @username, score: @score, created: @created, num_of_questions: @num_of_questions }.to_json
  end
end
