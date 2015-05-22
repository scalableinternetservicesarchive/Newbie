ThinkingSphinx::Index.define :post, :with => :real_time do
  # fields
  indexes title, :sortable => true
  indexes content

  # attributes
  has_many :comments
  has_many :favorite_posts
end
