require 'Nokogiri'
require 'HTTParty'
require 'byebug'

class Scrapper
  def initialize(product)
    @product = product
    @results = []
    @url = 'https://www.jumia.ug/'
  end

  def parser
    unparsed_page = HTTParty.get(my_url)
    Nokogiri::HTML(unparsed_page)
  end

  def total_results
    parser.css('header').css('p.-fs14').text.split(' ')[0].to_i
  end

  def my_results
    results = Array.new
    products = parser.css('div.info')
    products.each do |product|
      my_product = {
        name: product.css('h3.name').text,
        price: product.css('div.prc').text
      }
      results.push(my_product)
    end
    results
  end

  def my_url
    @url + '/catalog/?q='+ @product
  end
end
