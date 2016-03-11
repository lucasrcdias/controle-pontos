class Dashboard::FrequenciesController < Dashboard::BaseController
  expose(:frequencies) { current_company_user.company.frequencies }
  expose(:frequency, attributes: :frequency_params)

  def create
    frequency.save
    respond_with frequency, location: [:dashboard, :frequencies]
  end

  def update
    frequency.save
    respond_with frequency, location: [:dashboard, :frequencies]
  end

  def destroy
    frequency.destroy
    respond_with frequency, location: [:dashboard, :frequencies]
  end

  protected

  def frequency_params
    # Remove o valor vazio que vem do formulário gerado pelo
    # simple form.
    params[:frequency][:days].reject! { |day| !day.present? }
    params.require(:frequency).permit!
  end
end
