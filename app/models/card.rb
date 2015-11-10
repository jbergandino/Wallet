class Card < ActiveRecord::Base
	has_many :sharedcards
	has_many :users, through: :sharedcards

	validates :cardnum, presence: true
	validates :cardnum, length: { minimum: 16 }

	validates :cardnum, format: { with: 
		# check that credit card # entered is a valid card 
		# Includes 15-digit American Express numbers and 16-digit VISA, MasterCard, Discover, and Japan Credit Bureau card numbers. 
		/\A\b(?<!\-|\.)(?:(?:(?:4\d|5[1-5]|65)(\d\d)(?!\1{3})|35(?:2[89]|[3-8]\d)|6(?:011|4[4-9]\d|22(?:1(?!1\d|2[1-5])|[2-8]|9(?=1\d|2[1-5]))))([\ \-]?)(?<!\d\ \d{4}\ )(?!(\d)\3{3})(\d{4})\2(?!\4|(\d)\5{3}|1234|2345|3456|5678|7890)(\d{4})(?!\ \d{4}\ \d)\2(?!\6|(\d)\7{3}|1234|3456)|3[47]\d{2}([\ \-]?)(?<!\d\ \d{4}\ )(?!(\d)\9{5}|123456|234567|345678)\d{6}(?!\ \d{5}\ \d)\8(?!(\d)\10{4}|12345|56789|67890)\d)\d{4}(?!\-)(?!\.\d)\b\z/,

		message: "Please Insert a Valid Credit Card" }

	validates :cardexp, presence: true
	validates :cardexp, format: { with: /\A^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$\z/, message: "Please Insert a Valid Expiration Date"}

	validates :cardsecuritynum, presence: true
	# before_save :card_type
	# I attached the card type to a variable in the controller, it has been linked automatically and saved
	

end
