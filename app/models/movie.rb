class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true

  before_destroy :ensure_not_referenced_by_any_bookmark

  private

  def ensure_not_referenced_by_any_bookmark
    unless bookmarks.empty?
      errors.add(:base, 'Cannot delete movie while bookmarks reference it')
      throw(:abort)
    end
  end
end
