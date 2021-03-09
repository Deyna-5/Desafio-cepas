class Wine < ApplicationRecord
       has_many :wine_strains
       has_many :strains, through: :wine_strains

       has_many :oenologists, through: :wine_oenologist
       has_many :wine_oenologists
end
