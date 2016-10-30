module PathJoiner
  class PathJoiner
    def self.join_path(path, filename)
      Rails.root.join(path, filename)
    end
  end
end
