class Ingredient < ApplicationRecord

  before_destroy :check

  has_many :doses, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  private

  def check
    if self.doses.any?
      raise ActiveRecord::InvalidForeignKey
    end
  end

end
