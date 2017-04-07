class WelcomeController < ApplicationController
  layout 'landing'

  def index
    @tickers = Market.all
  end
end
