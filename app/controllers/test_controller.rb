class TestController < ApplicationController
  
  def New
    @name = params[:txtFirstName]
  end
  
 
end
