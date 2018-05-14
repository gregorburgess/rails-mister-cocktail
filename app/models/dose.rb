class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, :cocktail, :ingredient, presence: true
  validates :description, :presence => true
  # validates :cocktail_ingredient_pairing, uniqueness: true
  validates_uniqueness_of :cocktail_id, :scope => [:ingredient_id]
end
