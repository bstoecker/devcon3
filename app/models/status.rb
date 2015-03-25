class Status < ActiveRecord::Base
  belongs_to :user

  validates_length_of :content, :maximum => 255

  scope :recent, -> { order('updated_at DESC') }

  def self.default_scope
    recent
  end
end
