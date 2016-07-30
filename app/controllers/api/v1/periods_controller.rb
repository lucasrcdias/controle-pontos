module API
  class V1::PeriodsController < API::ApplicationController
    def index
      period = current_user.worker.period

      if period
        render json: period, status: :ok
      else
        render json: { period: { errors: "Período não encontrado" } }, status: :unauthorized
      end
    end
  end
end
