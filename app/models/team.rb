class Team < ActiveRecord::Base

  attr_accessor :user_name

  has_many :repositories
  has_and_belongs_to_many :users

  validates_uniqueness_of :name
  validates_length_of :description, :maximum => 255

  # scopes
  scope :recent_creation, -> { order("created_at DESC") }

end
