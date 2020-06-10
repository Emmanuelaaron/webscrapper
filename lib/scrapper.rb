require 'Nokogiri'
require 'HTTParty'
require 'byebug'

# Scrapper class
class Scrapper
  def initialize(product)
    @product = product
    @results = []
    @url = 'https://www.jumia.ug/'
  end

  def total_results
    parser.css('header').css('p.-fs14').text.split(' ')[0].to_i
  end

  def my_results(page_number = '1')
    products = parser(page_number).css('div.info')
    products.each do |product|
      my_product = {
        name: product.css('h3.name').text,
        price: product.css('div.prc').text,
        index: @results.count + 1
      }
      @results.push(my_product)
    end
    @results
  end

  def number_of_pages
    per_page = my_results.count
    return total_results / per_page if per_page == true
  end

  def get_product(my_index)
    @results[my_index - 1]
  end

  private

  def parser(page = '1')
    unparsed_page = HTTParty.get(my_url(page))
    Nokogiri::HTML(unparsed_page)
  end

  def my_url(page_number)
    "#{@url}/catalog/?q=#{@product}&page=#{page_number}"
  end
end
