class PurchasesController < ApplicationController
    def index
    end

    def new
      @purchase = Purchase.new
    end

    def import
      csv_handler = CsvHandler.new(params[:file])
      csv_handler.renameHeaders
      csv_handler.import
      revenue = csv_handler.totalRevenue
      flash[:revenue] = "Total revenue from imported file: #{revenue}"
      redirect_to new_purchase_path
    end
end
