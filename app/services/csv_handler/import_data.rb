module CsvHandler
  class ImportData
    def initialize(path, filename)
      @path = path
      @filename = filename
    end

    def import
      file_path = PathJoiner::PathJoiner.join_path(@path, @filename)
      CSV.foreach(file_path, headers: true) do |row|
        Purchase.create!(row.to_hash)
      end
    end
  end
end
