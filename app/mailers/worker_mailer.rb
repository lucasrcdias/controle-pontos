class WorkerMailer < ApplicationMailer
  def send_invite(worker, token)
    @worker = worker
    @token  = token

    mail subject: "#{Settings.app} | Acesse sua conta", to: worker.user.email
  end
end
