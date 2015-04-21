class Article
  include ActiveModel::Validations

  validates_presence_of :headline

  def initialize(attributes = {})
    self.attributes = attributes
  end

  def headline
    attributes['headline']['main'] if attributes['headline']
  end

  def kicker
    attributes['headline']['kicker']
  end

  def lead_paragraph
    attributes['lead_paragraph']
  end

  def abstract
    attributes['abstract']
  end

  def original_byline
    attributes['original byline']
  end

  private

  attr_accessor :attributes
end
