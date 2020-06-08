require_relative '../lib/scrapper'

puts '-----------------------------------'
puts 'Welcome to Jumia webScrapper'
puts '------------------------------------'
puts 'What would you like to buy'
puts '---------------------------------------'
product = gets .chomp
my_scrapper = Scrapper.new(product)
results = my_scrapper.total_results.to_s

puts "You have #{results} on #{my_scrapper.number_of_pages} pages"

puts 'please select which page you would love to view'
page = gets.chomp

p my_scrapper.my_results(page)
# p my_scrapper.my_results
