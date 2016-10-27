module CsvHandler
  class ImportData
    def initialize(path, filename)
      @path = path
      @filename = filename
    end

    def import
      file_path = PathJoiner::PathJoiner.join_path(@path, @filename)
      @import = Import.create
      CSV.foreach(file_path, headers: true) do |row|
        @import.purchases.create(row.to_hash)
        #Purchase.create!(row.to_hash)
        #@import = Purchase.last.create_import(import.last)
      end
    end
  end
end
