class Topic < Post
  POST_TYPES = %w[Info Discussion Question]

  has_many :responses

  validates_inclusion_of :post_type, in: POST_TYPES

  scope :recent, -> { order('updated_at DESC') }

  def self.default_scope
    recent
  end

  def self.post_types
    POST_TYPES
  end
end
