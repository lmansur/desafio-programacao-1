module CsvHandler
  class TotalRevenue
    def initialize(path, filename)
      @path = path
      @filename = filename
      @total_revenue = 0
    end

    def total_revenue
      file_path = PathJoiner::PathJoiner.join_path(@path, @filename)
      CSV.foreach(file_path, headers: true) do |row|
        @total_revenue += row[2].to_d*row[3].to_i
      end
      @total_revenue
    end
  end
end
