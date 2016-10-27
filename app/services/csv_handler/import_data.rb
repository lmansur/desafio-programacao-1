module CsvHandler
  class ImportData
    def initialize(file_path, file_name)
      @path = file_path
      @filename = file_name
    end

    def import
      file_path = PathJoiner::PathJoiner.join_path(@path, @filename)
      @import = Import.create
      CSV.foreach(file_path, headers: true) do |row|
        @import.purchases.create(row.to_hash)
      end
    end
  end
end
