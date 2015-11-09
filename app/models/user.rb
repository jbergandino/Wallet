class User < ActiveRecord::Base
	has_many :sharedcards
	has_many :cards, through: :sharedcards


  validates :email, presence: true
  validates :email, confirmation: true
  validates :fname, presence: true
  validates :lname, presence: true

  validates :password, presence: true
  # validates :password, :presence => { :message => " cannot be blank" }
  validates :password, confirmation:true
  validates :password, length: { minimum: 4 }

  # validates :password, confirmation: { message: "Password's Do Not Match!!!"}

end
