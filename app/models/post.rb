class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.persisted
    where.not(id: nil)
  end
end
