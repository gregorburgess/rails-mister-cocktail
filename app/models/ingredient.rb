class Ingredient < ApplicationRecord
  has_many :doses
  # before_destroy :check_use_of_in_cocktails


  validates :name, uniqueness: true
  validates :name, :presence => true
  # note that I don't need a validation to ensure that an ingredient is not destroyed if a cocktail uses it, as that is the default behaviour, the database protects it unless I make a dependant: destroy relationship
end
