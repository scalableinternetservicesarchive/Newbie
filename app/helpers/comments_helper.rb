module CommentsHelper
    def cache_key_for_comment(comment)
        "comment-#{comment.id}-#{comment.updated_at}"
    end
end
