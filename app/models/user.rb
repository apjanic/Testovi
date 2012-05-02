class User < ActiveRecord::Base
  before_create :encrypt_password
  
  
  
  # Email validation function
  # => input parameters: @email
  # => return: true or false
  def validateEmail(email)
    if email =~ /^.+@.+$/
      return true
    else
      return false
    end
  end
  
  # Username validation function
  # => input parameters: @username
  # => return: true or false
  def validateUsername(username)
    if username != ""
      if username =~ /\A[a-z][a-z0-9_-]{3,}\Z/
        return true
      else
        return false
      end
    end     
  end
  
  # Encrypt password before save to DB
  def encrypt_password
    if password.present?
      self.password = Digest::MD5.hexdigest(self.password)
    end
  end
end
