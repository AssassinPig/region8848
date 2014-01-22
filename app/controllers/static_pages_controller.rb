class StaticPagesController < ApplicationController
  def home
      Rails.logger.debug("home action") 
      Rails.logger.debug(params);
  end

  def notes
      @passages = Passages.all
      Rails.logger.debug("get passages") 
      Rails.logger.debug(@passages) 
  end

  def passages
      @passages = Passages.all
  end

  def about_me
  end

  def admin
      if params[:password][:password] == "654321"
        @passages = Passages.all
        Rails.logger.debug("ok admin") 
        flash.now[:success] = "welcome!!!" 
      else 
        flash.now[:error] = "you can't do this"
        redirect_to(static_pages_home_path)
      end
  end
end
