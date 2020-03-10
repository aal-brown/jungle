class User < ActiveRecord::Base

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  # This checks the match of the passwords
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    email = email.strip().downcase()
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      return @user
    end
    return nil
  end
  
end
