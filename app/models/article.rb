class Article < ApplicationRecord
  belongs_to :user

  before_save :generate_slug

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :body, presence: true, length: { minimum: 10 }

  serialize :tag_list, Array

  private

  def generate_slug
    self.slug = title.parameterize
  end
end
