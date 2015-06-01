module PostsHelper
    include ActsAsTaggableOn::TagsHelper
    def cache_key_for_post(post)
        "post-#{post.id}-#{post.updated_at}-#{post.pictures.size}-#{post.upvote_number}-#{post.downvote_number}-#{post.favorite_posts.size}"
    end
end
