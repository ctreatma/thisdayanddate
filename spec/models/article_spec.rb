require 'rails_helper'

describe Article do
  context 'when JSON is empty' do
    it 'should not be valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'when JSON specifies the minimum fields' do
    subject do
      attributes = JSON.parse(File.read('spec/fixtures/min_article.json')) 
      Article.new attributes
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have the correct headline' do
      expect(subject.headline).to eql 'The Headline'
    end
  end

  context 'when JSON specifies all fields' do
    subject do
      attributes = JSON.parse(File.read('spec/fixtures/full_article.json'))
      Article.new attributes
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have the correct headline' do
      expect(subject.headline).to eql 'The Headline'
    end

    it 'should have the correct kicker' do
      expect(subject.kicker).to eql 'The Kicker'
    end

    it 'should have the correct abstract' do
      expect(subject.abstract).to eql 'The Abstract'
    end

    it 'should have the correct lead paragraph' do
      expect(subject.lead_paragraph).to eql 'The lead paragraph'
    end

    it 'should have the correct original byline' do
      expect(subject.original_byline).to eql 'The byline'
    end
  end
end

