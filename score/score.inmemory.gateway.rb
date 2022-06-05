require 'singleton'

class ScoreInMemoryGateway
  include Singleton

  def initialize
    @scores = []
  end

  def save(score)
    @scores.push(score)
    score
  end

  def scores
    @scores
  end
end
