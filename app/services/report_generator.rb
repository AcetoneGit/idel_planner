class ReportGenerator
  def initialize(start_date, end_date, user)
    @start_date = start_date.beginning_of_day
    @end_date = end_date.end_of_day
    @user = user
  end

  def generate
    appointments = Appointment.where(start_date: @start_date..@end_date, user: @user)

    report_text = "Relève du #{@start_date.strftime('%d/%m/%Y')} au #{@end_date.strftime('%d/%m/%Y')} :\n\n"

    if appointments.any?
      appointments.each do |appointment|
        report_text += format_appointment(appointment)
      end
    else
      report_text += "Aucun rendez-vous trouvé pour la période sélectionnée.\n"
    end

    report_text
  end

  private

  def format_appointment(appointment)
    <<~TEXT
      Nom du patient : #{appointment.patient.first_name} #{appointment.patient.last_name}
      Date : #{appointment.start_date.strftime("%d/%m à %Hh%M")}
      Raison du rendez-vous : #{appointment.reason || 'Non spécifiée'}
      Résumé : #{appointment.summary || 'Non spécifiée'}

    TEXT
  end
end
