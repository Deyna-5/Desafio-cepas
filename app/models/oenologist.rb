class Oenologist < ApplicationRecord
       has_many :wines, through: :wine_oenologist
       has_many :wine_oenologists
       has_many :magazines_oenologists
       has_many :magazines, through: :magazines_oenologists
end
