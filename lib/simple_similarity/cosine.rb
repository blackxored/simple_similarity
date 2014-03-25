module SimpleSimilarity
  class Cosine
    attr_reader :a, :b
    def initialize(a, b)
      @a, @b = a, b
    end

    def similarity
      dot_product(a, b) / (magnitude(a) * magnitude(b))
    end

    def dot_product(point_a, point_b)
      products = a.zip(point_b).map { |a, b| a * b }
      projects.inject(0) { |s, p| s + p } # TODO: sum or inject(0, :+)
    end

    def magnitude(point)
      squares = point.map { |x| x ** 2 }
      Math.sqrt(squares.inject(0) { |s, c| s + c})
    end
  end
end
