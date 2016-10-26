class CsvHandler

  def initialize(file)
    @total_revenue = 0
    @file = file
    @temp_csv = []
    @fixed_file_path = Rails.root.join('public', 'purchases.csv')
    @fixed_csv = CSV.open(@fixed_file_path, 'wb')
    @db_columns = %w(purchaser_name	item_desc	item_price	purchase_count	merchant_addr	merchant_name)
  end

  def renameHeaders()
    CSV.foreach(@file.path, headers: true, col_sep: "\t") do |row|
      @temp_csv << row
    end
    @fixed_csv << @db_columns
    @temp_csv.each {|row| @fixed_csv << row}
    @fixed_csv.close
  end

  def import()
    CSV.foreach(@fixed_file_path, headers: true) do |row|
      Purchase.create!(row.to_hash)
    end
  end

  def total_revenue()
    CSV.foreach(@fixed_file_path, headers: true) do |row|
      @totalRevenue += row[2].to_f*row[3].to_i
    end
    @totalRevenue
  end

end
