require 'spec_helper'

describe WorkerService do
  let(:user)           { build(:user, password: '', password_confirmation: '') }
  let(:worker)         { build(:pf_worker, user: user) }
  let(:worker_service) { WorkerService.new(worker) }

  describe "instance methods" do
    context "invite" do
      before { worker_service.invite }
      it "should setup and invite worker" do
        expect(worker.user.password).not_to be_empty

        expect(worker.user.confirmed_at).not_to           be_nil
        expect(worker.user.reset_password_token).not_to   be_nil
        expect(worker.user.reset_password_sent_at).not_to be_nil
      end
    end #context
  end #describe
end
