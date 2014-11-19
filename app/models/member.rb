class Member < Account
  
  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  
end