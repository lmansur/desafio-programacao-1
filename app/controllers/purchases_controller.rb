class PurchasesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
    def new
      @purchase = Purchase.new
    end

    def create
      file_importer = FileImporter::FileImporter.new(params[:purchase][:file])
      if file_importer.run
        redirect_to(import_path(Import.last),
                     notice: 'Purchases successfully added to database.')
      else
        redirect_to(new_purchase_path, alert: file_importer.errors_full)
      end
    end
end
