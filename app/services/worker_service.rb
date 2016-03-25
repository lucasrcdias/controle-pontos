class WorkerService
  def initialize(worker)
    @worker = worker
  end

  def invite
    setup_worker

    @worker.save && WorkerMailer.send_invite(@worker, @generated_password).deliver_later
  end

  private

  def setup_worker
    @generated_password   = Devise.friendly_token.first(8)
    @worker.user.password = @generated_password

    @worker.user.skip_confirmation!
  end
end
