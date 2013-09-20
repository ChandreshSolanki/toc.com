class WorksController < ApplicationController
  before_filter :authenticate_work, :only => [:home]
  
  def signup
   @work = Work.new
  end
  def signin
   @work=Work.new
  end
  
  def create
   @work = Work.new(params[:work])
    if @work.save
      #work_mailer.email(@work).deliver
       redirect_to signin_works_path
    else
      flash[:error] = @work.errors.full_messages.join("<br/>")
      render :signup
    end
  end
  
  def home
   @work= Work.new
  end

  def check_signin
    @work = Work.where(:email => params[:work][:email], :encrypted_password => params[:work][:encrypted_password]).first
    if @work.present?
      session[:work_id]= @work.id
      flash[:notice] = "signin successfully"
      redirect_to home_works_path
    else
      @work= Work.new
      flash[:error] = "Email or password is wrong"
      render :signin
    end
  end
  
  def logout
   @work = Work.new
  end
  
  def back
   @work = Work.new
  end
 
  
  def update_profile
   @work = Work.find_by_id(params[:work][:id])
   if @work.update_attributes(params[:work])
      redirect_to root_path
   end
  end
  
  def edit_profile
   @work = Work.new
  end
  
   def authenticate_work
    if session[:work_id].present?
      @current_work = Work.find(session[:work_id])
    else
      flash[:error] = "Please login first to access the page"
      redirect_to root_path and return
    end
  end
  
end
