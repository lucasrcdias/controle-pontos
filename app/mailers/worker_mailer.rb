class WorkerMailer < ApplicationMailer
  def send_invite(worker, password)
    @worker   = worker
    @password = password

    mail subject: "#{Settings.app} | Acesse sua conta", to: worker.user.email
  end
end
