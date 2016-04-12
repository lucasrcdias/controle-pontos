class WorkerMailerPreview < ActionMailer::Preview
  def send_invite
    WorkerMailer.send_invite(Worker.last, 'faketoken')
  end
end
