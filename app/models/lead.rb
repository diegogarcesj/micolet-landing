class Lead < ApplicationRecord
  
  validates :email, uniqueness: :true
  validate :at_least_one_checkbox

  private

  def at_least_one_checkbox
    unless women || men || children
      errors.add(:base, "Select at least one checkbox")
    end
  end
end
