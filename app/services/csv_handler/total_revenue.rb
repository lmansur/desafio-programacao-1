module CsvHandler
  class TotalRevenue
    def initialize(path, filename, last_import)
      @path = path
      @filename = filename
      @last_import = last_import
      @total_revenue = 0
    end

    def total_revenue
      file_path = PathJoiner::PathJoiner.join_path(@path, @filename)
      CSV.foreach(file_path, headers: true) do |row|
        @total_revenue += row[2].to_d*row[3].to_i
      end
      @last_import.update_attributes(total_revenue: @total_revenue)
    end
  end
end
