class SearchForm 
  include ActiveModel::Model

  attr_accessor :keyword
  validates :keyword, presence: true, length: { maximum: 100 } 
end
