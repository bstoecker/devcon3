class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :role
  validates_presence_of :email
  validates_presence_of :password, on: :create

  has_many :topics
  has_many :responses
  has_many :status

  has_and_belongs_to_many :teams

  def full_name
    "#{first_name} #{last_name}"
  end
end
