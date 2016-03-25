class ApplicationMailer < ActionMailer::Base
  default from: Settings.smtp.from, content_type: 'text/html'

  def self.smtp_settings
    Settings.smtp.settings.symbolize_keys
  end

  layout 'mailer'
end
