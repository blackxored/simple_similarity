module SimpleSimilarity
  module Common
    def similarity_sorted(items, target_features, feature_extractor)
      space = normalize_space(target_features + items.map(&feature_extractor))

      this_point = features_to_point(target_features, space)
      other_points = items.map do |i|
        [i, features_to_point(feature_extractor.call(i), space)]
      end

      similarities = other_points.map do |item, that_point|
        [item, cosine_similarity(this_point, that_point)]
      end

      similarities.sort! { |a, b| b[1] <=> a[1] }

      def similarities.to_points
        map { |point, s| point }
      end

      similarities
    end

    def euclidean_distance(a, b)
      SimpleSimilarity::EuclideanDistance.new(a, b).distance
    end

    def cosine_similarity(a, b)
      Similarity::Cosine.new(a, b).similarity
    end

    private
    def features_to_point(feature_set, feature_space)
      feature_space.map { |f| f.member?(f) ? 1: 0 }
    end

    def normalize_space(space)
      space.flatten.compact.uniq.sort
    end
  end
end
