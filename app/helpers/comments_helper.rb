module CommentsHelper
  def rating(service)
    service.comments.average(:rating).round(1)
  end

  def count_reviews(service)
    service.comments.length
  end
end
