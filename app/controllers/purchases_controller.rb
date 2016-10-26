class PurchasesController < ApplicationController
    def index
    end

    def new
      @purchase = Purchase.new
    end
end
