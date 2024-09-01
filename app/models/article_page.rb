class ArticlePage < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :body, presence: true, length: { minimum: 10 }
end
