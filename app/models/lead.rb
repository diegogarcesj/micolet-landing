class Lead < ApplicationRecord
  include EmailValidatable
  validate :at_least_one_checkbox

  private

  def at_least_one_checkbox
    unless women || men || children
      errors.add(:base, "Select at least one checkbox")
    end
  end
end
