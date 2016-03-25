class Dashboard::WorkersController < Dashboard::BaseController
  expose(:q)           { Worker.ransack(params[:q]) }
  expose(:roles)       { current_user.company.roles }
  expose(:workers)     { q.result.page(params[:page]) }
  expose(:periods)     { current_user.company.periods }
  expose(:frequencies) { current_user.company.frequencies }
  expose(:worker, attributes: :worker_params)

  def new
    worker.user = User.new unless worker.user.present?
  end

  def create
    worker.company = current_user.company

    WorkerService.new(worker).invite

    respond_with worker, location: [:dashboard, :workers]
  end

  def update
    worker.save

    respond_with worker, location: [:dashboard, :workers]
  end

  def destroy
    worker.destroy

    respond_with worker, location: [:dashboard, :workers]
  end

  private

  def worker_params
    params.require(:worker).permit!
  end
end
