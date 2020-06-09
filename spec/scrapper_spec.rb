require './lib/scrapper'
require 'Nokogiri'
require 'HTTParty'

describe 'Scrapper' do
  let(:my_scrapper) { Scrapper.new('phones') }
  let(:jumia_url) { 'https://www.jumia.ug//catalog/?q=phones&page=1' }
  describe '#parser' do
    it 'return nokogiri' do
      expect(my_scrapper.parser).to be_truthy
    end
  end
  describe '#my_url' do
    it 'returns the url to be scrapped' do
      expect(my_scrapper.my_url(1)).to eql(jumia_url)
    end
  end

  describe '#total_results' do
    it 'returns total number of results that are integers' do
      expect(my_scrapper.total_results.class).to eql(100.class)
    end
  end

  describe '#my_results' do
    it 'returns an array of results' do
      expect(my_scrapper.my_results).to be_an_instance_of(Array)
    end
  end
end
