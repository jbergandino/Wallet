class User < ActiveRecord::Base
	has_many :sharedcards
	has_many :cards, through: :sharedcards


  validates :email, presence: true
  validates :email, confirmation: true
  validates :email, uniqueness: true

  validates :fname, presence: true
  validates :lname, presence: true

  validates :password, presence: true
  # validates :password, :presence => { :message => " cannot be blank" }
  validates :password, confirmation:true
  validates :password, length: { minimum: 4 }

  # validates :password, confirmation: { message: "Password's Do Not Match!!!"}

  # Phone Number Format Validation
  validates :phone, format: { with: /\A^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$\z/,
  message: "Please Insert a Valid Phone Number" } 

end
