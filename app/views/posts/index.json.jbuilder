json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :datetime, :content, :image_url, :downvote_number, :upvote_number
  json.url post_url(post, format: :json)
end
