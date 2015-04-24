ThinkingSphinx::Index.define :post, :with => :real_time do
  # fields
  indexes title, :sortable => true
  indexes content

  # attributes
  #has created_at, updated_at, :type => :string
end
