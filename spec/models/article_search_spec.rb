require 'rails_helper'

describe ArticleSearch do
  context 'when there are no search results' do
    subject do
      ArticleSearch.new(begin_date: '18510101', end_date: '18510101')
    end

    it 'should not have any articles' do
      VCR.use_cassette('no_results') do
        expect(subject.fetch).to be_empty
      end
    end
  end

  context 'when there are search results' do
    subject do
      ArticleSearch.new(begin_date: '19790105', end_date: '19790105')
    end

    it 'should have 10 articles' do
      VCR.use_cassette('search_results') do
        expect(subject.fetch.size).to eql 10
      end
    end
  end
end