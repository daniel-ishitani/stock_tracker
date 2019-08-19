class StocksController < ApplicationController
    def search
        @stock = Stock.new_from_lookup(params[:stock])
        if @stock.nil?
            flash.now[:error] = 'Ticker not found'
        end
        
        respond_to do |format|
            format.js {render partial: 'users/result' }
        end
    end
end