class ApplicationMailer < ActionMailer::Base
  default from: Settings.smtp.from, content_type: 'text/html'

  layout 'mailer'
end
