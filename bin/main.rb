require_relative '../lib/scrapper'

puts '-----------------------------------'
puts 'Welcome to Jumia webScrapper'
puts '------------------------------------'
puts 'What would you like to buy'
puts '---------------------------------------'
product = gets .chomp
my_scrapper = Scrapper.new(product)

p my_scrapper.total_results
