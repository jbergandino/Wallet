class Sharedcard < ActiveRecord::Base
	belongs_to :user
	belongs_to :card

	validates :user_id, presence: true
	# validates :user_id, :presence => {:message => 'Please Enter a User'}

end
