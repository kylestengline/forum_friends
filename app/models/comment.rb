class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true

  def self.persisted
    where.not(id: nil)
  end
end
