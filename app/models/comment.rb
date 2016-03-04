class Comment < ActiveRecord::Base
  validates :user, presence: true
  validates :mark, presence: true
  validates :mark, :numericality =>{ :greater_than_or_equal_to => 0, :less_than_or_equal_to =>5}
  belongs_to :user
  belongs_to :article

  after_save :article_rate

  def average_rating
    self.article.comments.average(:mark)
  end

  def article_rate
    self.article.update_column(:mark, average_rating)
  end
end
