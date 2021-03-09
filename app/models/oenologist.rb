class Oenologist < ApplicationRecord
       has_many :wines, through: :wine_oenologist
       has_many :wine_oenologists
end
