class WeekDays < EnumerateIt::Base
  associate_values(
    monday: [1, 'Segunda-feira'],
    tuesday: [2, 'Terça-feira'],
    wednesday: [3, 'Quarta-feira'],
    thursday: [4, 'Quinta-feira'],
    friday: [5, 'Sexta-feira'],
    saturday: [6, 'Sábado'],
    sunday: [7, 'Domingo']
  )

  def self.week_days_from_array(days_list)
    week_days = []

    days_list.sort_by(&:to_i).each do |day|
      week_days << WeekDays.t(day) unless day.nil?
    end

    week_days.to_sentence
  end
end
