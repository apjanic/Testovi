class UsersController < ApplicationController
  def new
    @userRoles = {"" => 0, "Registered" => 1, "Administrator" => 2 }    
    if request.post?
      email = params["txtEmail"]
      username = params["txtUsername"]
      
      @warnings = Hash.new      
      user = User.new
      
      #validate username
      if(!user.validateUsername(username))
        @warnings["username"] = "Please check your username. Username must be minimum four characters long and contain letters, numbers, hyphens and underscores."
      else
        session[:username] = username
      end
      
      #validate password
      if(params["txtPassword"] == '')
        @warnings[:password] = "Please check your password. Password cannot be empty."
      end
       
      #validate email
      if(!user.validateEmail(email))
        @warnings["email"] = "Please fill in valid email address!"
      else
        session[:email] = email
      end
      
      #validate role
      if(params["cboRole"] == '0')
        @warnings["role"] = "Please select user role."
      else
        session[:userRole] = params["cboRole"]
      end      
      
      #store first name and last name to session and use it later
      session[:firstName] = params["txtFirstName"]
      session[:lastName]  = params["txtLastName"]
      session[:userRole]  = params["cboRole"]
      
      if(@warnings.keys.count > 0)
        @warningMessage = '<div class="alert alert-error">You cannot add new user. Please check following:<br><ul>'
        
        @warnings.each do |key, value|
          @warningMessage += '<li>' + value + '</li>'
        end
        
        @warningMessage += '</ul></div>'
      else
        newUser = User.create(:username   => username,
                              :password   => params["txtPassword"],
                              :firstName  => params["txtFirstName"],
                              :lastName   => params["txtLastName"],
                              :email      => email)
        newUser.save

        @infoMessage = '<div class="alert alert-success">You have successfully added a new user.</div>'
      end                   
    else
      
    end 
  end
    
  def login
    if session["sessionID"]
      #redirect_to "/users/new"
    else
      @user = User.new
      if request.post?
        
        @user = User.find_by_username_and_password(params["txtUsername"], Digest::MD5.hexdigest(params["txtPassword"]))
        
        if @user != nil                
          flash[:status] = '<div class="alert alert-success">You have successfully logged in.</div>'
          session["sessionID"] = @user.id
          redirect_to root_url
        else
          flash[:status] = '<div class="alert alert-error">Please check your username and password.</div>'
        end
                   
      end
    end
    
  end
  
  def logout
    if(session["sessionID"])
      reset_session
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
  
end
