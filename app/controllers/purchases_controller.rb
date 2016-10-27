class PurchasesController < ApplicationController

    before_action :authenticate_user!, except: :index
    def index
    end

    def show
      @purchase = Purchase.find(params[:id])
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
      total_revenue = revenue.total_revenue
      flash[:revenue] = "Total revenue from imported file: #{total_revenue}"
      redirect_to new_purchase_path
    end
end
