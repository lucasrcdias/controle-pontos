class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      if resource.worker?
        sign_out
        return redirect_worker
      end
    end
  end

  private

  def redirect_worker
    redirect_to worker_confirmation_path
  end
end
