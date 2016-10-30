class ImportsController < ApplicationController

  def show
    @import = Import.find(params[:id])
    @purchase = Purchase.where(import_id: @import.id)
  end

end
