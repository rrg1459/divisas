class DivisasController < ApplicationController

  require 'open-uri'
  require 'nokogiri'

  def scraping
    page = Nokogiri.HTML(open('https://www.bcv.org.ve/'))
    dolar = page.at_css('[id="dolar"]').at_css('[class="col-sm-6 col-xs-6 centrado"]').text.strip.gsub!(',','.').to_f.round(4)
    euro = page.at_css('[id="euro"]').at_css('[class="col-sm-6 col-xs-6 centrado"]').text.strip.gsub!(',','.').to_f.round(4)
    date = page.at_css('[class="date-display-single"]').text
    render json: { date: date, dolar: dolar, euro: euro }
  end

end
