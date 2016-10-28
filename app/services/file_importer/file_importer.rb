module FileImporter
  class FileImporter

    def initialize(file, new_file_path='public', new_file_name='purchases.csv')
      @new_file_path = new_file_path
      @new_file_name = new_file_name
      @file = file
    end

    def run
      rename_headers
      import_data
      total_revenue
      true
    end

    private

      def rename_headers
        header = CsvHandler::RenameHeaders.new(@file)
        header.rename_headers
      end

      def import_data
        importer = CsvHandler::ImportData.new(@new_file_path, @new_file_name)
        importer.import
      end

      def total_revenue
        revenue = CsvHandler::TotalRevenue.new(@new_file_path, @new_file_name)
        revenue.total_revenue
      end

  end
end
