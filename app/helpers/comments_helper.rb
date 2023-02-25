module CommentsHelper
  # Show comment with only today time or with full datetime
  def comment_datetime(comment)
    comment.created_at.today? ? comment.created_at.strftime("%I:%M%p") : comment.created_at.strftime("%a, %b %d - %I:%M%p")
  end
end
