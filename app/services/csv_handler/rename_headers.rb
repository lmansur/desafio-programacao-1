module CsvHandler
  class RenameHeaders
    def initialize(file)
      @file = file
      @db_columns = %w(purchaser_name	item_desc	item_price	purchase_count	merchant_addr	merchant_name)
      @temporary_csv = []
      @fixed_csv = CSV.open(PathJoiner::PathJoiner.join_path('public', 'purchases.csv'), 'wb')
    end

    def rename_headers
      CSV.foreach(@file.path, headers: true, col_sep: "\t") do |row|
        @temporary_csv << row
      end
      @fixed_csv << @db_columns
      @temporary_csv.each { |row| @fixed_csv << row }
      @fixed_csv.close
    end
  end
end
