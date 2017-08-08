class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password
  validates :email, uniqueness: true
  validates :first_name, :last_name, :password, :password_confirmation, :email, presence: true
  validates :password, length: { minimum: 6 }
  def self.authenticate_with_credentials(email, password)
    user = User.where('lower(email) = lower(?)', email.strip).first
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
