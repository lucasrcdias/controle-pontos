class FrequencyValidator < ActiveModel::Validator

  # Se o administrador não selecionar nenhum dia ou por algum motivo o valor que vier da tela
  # não estiver incluso na lista de dias, adicionaremos o erro.
  def validate(record)
    record.days = record.days.delete_if { |day| day.nil? || WeekDays.list.exclude?(day) }
    record.errors.add(:days, "Selecione ao menos um dia da semana") if record.days.blank?
  end
end
