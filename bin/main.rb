require_relative '../lib/scrapper'

puts '-----------------------------------'
puts 'Welcome to Jumia webScrapper'
puts '------------------------------------'
puts 'What would you like to buy'
puts '---------------------------------------'
@product = gets.chomp
@my_scrapper = Scrapper.new(@product)
@results = @my_scrapper.total_results.to_s
until @results.to_i.positive?
  puts 'Your Search result was zero!!! Please search for another item'
  @product = gets.chomp
  @my_scrapper = Scrapper.new(@product)
  @results = @my_scrapper.total_results.to_s
end

puts "You have #{@results} results on #{@my_scrapper.number_of_pages} pages"

puts 'please select which page you would love to view from 1 to 50'
page = gets.chomp.to_i
page_numbers = (1..50)
until page_numbers.include? page
  puts 'invalid page selection select from 1 to 50'
  page = gets.chomp.to_i
end
puts '-------------------------------------'
p @my_scrapper.my_results(page.to_s)

puts 'select which product you like by the value of the index'

puts '-------------------------------------'

product_index = gets.chomp.to_i
products_range = (1..@my_scrapper.my_results(page.to_s).length)
until products_range.include? product_index
  puts 'product does not exits select valid index between 1 and 48'
  product_index = gets.chomp.to_i
end

puts '---------------------------------------'

p @my_scrapper.get_product(product_index)
