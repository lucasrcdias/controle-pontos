class Dashboard::WorkersController < Dashboard::BaseController
  expose(:q)           { current_user.company.workers.ransack(params[:q]) }
  expose(:roles)       { current_user.company.roles }
  expose(:workers)     { q.result.order(:admitted_at).page(params[:page]) }
  expose(:periods)     { current_user.company.periods }
  expose(:frequencies) { current_user.company.frequencies }
  expose(:worker, attributes: :worker_params)
  expose(:user)        { worker.user }

  add_breadcrumb I18n.t("titles.dashboard.workers.index"), :dashboard_workers_path, except: :show
  add_breadcrumb :user, -> c {}, only: :edit
  add_breadcrumb I18n.t("titles.dashboard.workers.new"), -> c {}, only: :new

  def new
    worker.user = User.new
  end

  def create
    worker.company = current_user.company

    WorkerService.new(worker).invite

    respond_with worker, location: [:dashboard, :workers]
  end

  def show
    date = params[:date] ? Date.parse(params[:date]) : Date.today

    @points = worker.points.on_month(date)
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
