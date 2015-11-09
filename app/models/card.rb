class Card < ActiveRecord::Base
	has_many :sharedcards
	has_many :users, through: :sharedcards

	validates :cardnum, presence: true
	validates :cardnum, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

end
