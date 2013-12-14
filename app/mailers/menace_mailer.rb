class MenaceMailer < ActionMailer::Base
  default from: "cmujeevanapp@gmail.com"

  def created(menace)
    @menace = menace
    mail(
      to: @menace.email, 
      subject: "Thanks for reporting using CMU Jeevan app!",
      css: ['created_email']) 
  end
end
