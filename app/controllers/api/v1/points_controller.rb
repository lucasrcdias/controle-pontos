module API
  class V1::PointsController < API::ApplicationController
    def create
      point = Point.new(points_params.merge!(worker: current_user.worker))

      if point.save
        render json: point, status: :created
      else
        render json: { point: { errors: point.errors.messages } }, status: :unprocessable_entity
      end
    end

    private

    def points_params
      params.require(:point).permit(:latitude, :longitude)
    end
  end
end
