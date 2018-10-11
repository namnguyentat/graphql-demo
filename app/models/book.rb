class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def created_at_str
    created_at.strftime('%Y-%m-%d')
  end
end
