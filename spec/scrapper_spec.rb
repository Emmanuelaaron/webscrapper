require './lib/scrapper'
require 'Nokogiri'
require 'HTTParty'

describe 'Scrapper' do
  let(:my_scrapper) { Scrapper.new('phones') }
  let(:jumia_url) { 'https://www.jumia.ug//catalog/?q=phones&page=1' }
  # let(:my_parsed_url) { Nokogiri::HTML(HTTParty.get(jumia_url)) }
  # describe '#parser' do
  #   it 'returns the url of jumia website' do
  #     expect(my_scrapper.parser).to eql(my_parsed_url)
  #   end
  # end
  describe '#my_url' do
    it 'returns the url to be scrapped' do
      expect(my_scrapper.my_url(1)).to eql(jumia_url)
    end
  end
end
