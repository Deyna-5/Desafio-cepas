class Magazine < ApplicationRecord
       has_many :magazines_oenologists
       has_many :oenologist, through: :magazines_oenologists
end
