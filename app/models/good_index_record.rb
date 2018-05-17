class GoodIndexRecord < ApplicationRecord
	has_many :good_index_items
	accepts_nested_attributes_for :good_index_items
end
