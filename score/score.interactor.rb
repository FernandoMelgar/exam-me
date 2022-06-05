class ScoreInteractor

  def initialize(score_gateway)
    @score_gateway = score_gateway
  end

  def save(score)
    @score_gateway.save(score)
  end

  def all
    @score_gateway.scores
  end

  def all_order_desc
    @score_gateway.scores.sort_by(&:score)
  end

  def all_order_asc
    @score_gateway.scores.sort_by(&:score).reverse
  end
end