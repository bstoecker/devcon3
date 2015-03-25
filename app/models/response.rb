class Response < Post
  belongs_to :topic

  def title
    self.topic.title
  end
end
