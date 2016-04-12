class WorkerService
  def initialize(worker)
    @worker = worker
  end

  def invite
    setup_worker

    @worker.save && WorkerMailer.send_invite(@worker, @token).deliver_later
  end

  private

  def setup_worker
    generated_password    = Devise.friendly_token.first(8)
    @worker.user.password = generated_password

    set_reset_token

    @worker.user.skip_confirmation!
  end

  def set_reset_token
    @token, enc = Devise.token_generator.generate(User, :reset_password_token)

    @worker.user.reset_password_token   = enc
    @worker.user.reset_password_sent_at = Time.now.utc
  end
end
