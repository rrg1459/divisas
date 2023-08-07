class DivisasController < ApplicationController

  include ActionController::MimeResponds

  require 'open-uri'
  require 'nokogiri'

  def scraping
    page = Nokogiri.HTML(open('https://www.bcv.org.ve/'))
    dolar = page.at_css('[id="dolar"]').at_css('[class="col-sm-6 col-xs-6 centrado"]').text.strip.gsub!(',','.').to_f.truncate(2)
    euro = page.at_css('[id="euro"]').at_css('[class="col-sm-6 col-xs-6 centrado"]').text.strip.gsub!(',','.').to_f.truncate(2)
    date = page.at_css('[class="date-display-single"]').text
    render json: { date: date, dolar: dolar, euro: euro }
  end

  def policy
  end

end
