class Card < ApplicationRecord
	has_one :player
	has_one :team
	has_one :company
	has_one :condition
end
