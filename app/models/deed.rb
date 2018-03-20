class Deed < ApplicationRecord
  belongs_to :user
  validate :something_was_done,
           if: ->(deed) { deed.miles.present? && deed.trash_bags.present? }
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :miles, :trash_bags, :avatar, presence: true

  def something_was_done
    errors.add(:base, :nothing_was_done) if (trash_bags + miles) < 1
  end
end
