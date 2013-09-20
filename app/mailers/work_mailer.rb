class WorkMailer < ActionMailer::Base
  default from: "chandresh@grepruby.com"
   def email(work)
    @work = work
    @url  = 'http://example.com/login'
    mail(to: @work.email, subject: 'Welcome to My Awesome Site')
  end
end
