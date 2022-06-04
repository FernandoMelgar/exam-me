# Model representation of a Question
class Question

  def initialize(id, title)
    @id = id
    @title = title
  end

  def to_json(*_args)
    { id: @id, title: @title }.to_json
  end

  attr_reader :id, :title
end
