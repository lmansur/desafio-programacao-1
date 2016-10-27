class PurchasesController < ApplicationController

    before_action :authenticate_user!, except: :index
    def index
    end

    def show

    end

    def new
      @purchase = Purchase.new
    end

    def create
      file_path = 'public'
      file_name = 'purchases.csv'

      header = CsvHandler::RenameHeaders.new(params[:purchase][:file])
      header.rename_headers

      importer = CsvHandler::ImportData.new(file_path, file_name)
      importer.import

      revenue = CsvHandler::TotalRevenue.new(file_path, file_name)
      revenue.total_revenue
      redirect_to import_path(Import.last)
      flash[:notice] = 'Purchases successfully added to database.'
    end
end
