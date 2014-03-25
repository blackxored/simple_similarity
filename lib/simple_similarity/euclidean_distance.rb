module SimpleSimilarity
  class EuclideanDistance
    attr_reader :point_a, :point_b

    def initialize(point_a, point_b)
      @point_a, @point_b = point_a, point_b
    end

    def distance
      sq = point_a.zip(point_b).map { |a, b| (a - b) ** 2 }
      Math.sqrt(sq.inject(0) { |s, c| s + c}) # TODO: sum, inject(0, :+)
    end
  end
end
