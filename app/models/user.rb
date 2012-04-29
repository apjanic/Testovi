class User < ActiveRecord::Base
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
end
