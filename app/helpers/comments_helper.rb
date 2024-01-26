module CommentsHelper
  # Show comment with only today time or with full datetime
  def comment_datetime(comment)
    if comment.created_at.today? then time_format(comment) else datetime_format(comment) end
  end

  private
    def time_format(comment)
      comment.created_at.strftime("%I:%M%p")
    end

    def datetime_format(comment)
      comment.created_at.strftime("%a, %b %d - %I:%M%p")
    end
end
