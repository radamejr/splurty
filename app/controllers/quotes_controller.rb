class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
      @quote = Quote.create(quote_params)

      if @quote.invalid?

        flash[:error] = 'Could not save. Quote and Author require minimum 3 characters with a max of 140 and 50'

      end


      redirect_to root_path
  end


  def about

  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end



end
