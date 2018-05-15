class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy

  # def doses
  #   Dose.where(cocktail_id: self.id)
  # end

  has_many :ingredients, through: :doses

  validates :name, uniqueness: true
  validates :name, :presence => true

end
