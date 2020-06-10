require_relative '../lib/scrapper'

describe 'Scrapper' do
  let(:my_scrapper) { Scrapper.new('phones') }
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

  describe '#get_product' do
    it 'return a hash of a product' do
      expect(my_scrapper.get_product(30)).to be_falsey
    end
  end

  describe '#number_of_pages' do
    it 'returns the numbers of pages returned' do
      expect(my_scrapper.number_of_pages.class).to eql(Integer)
    end
  end
end
