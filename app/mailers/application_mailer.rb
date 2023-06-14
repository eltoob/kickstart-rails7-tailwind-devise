class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{ENV["EMAIL_DOMAIN_NAME"]}"
  layout "mailer"
end
