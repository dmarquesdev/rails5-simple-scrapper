class Page < ApplicationRecord
	has_many :links
	has_many :titles
end
