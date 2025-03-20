class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:update, :destroy, :show]
  before_action :set_params, only: [:index, :create]

  def index
    @appointment = Appointment.new
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @patient = @appointment.patient
    @editing_summary = params[:editing_summary] == "true"
    @editing_details = params[:editing_details] == "true"
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user

    if @appointment.save
      jd = @appointment.date.to_datetime.jd
      redirect_to appointments_path(jd: jd, display: 'day'), notice: "Rendez-vous créé !"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @patient = @appointment.patient

    if @appointment.update(appointment_params)
      jd = @appointment.date.to_datetime.jd
      redirect_to appointments_path(jd: jd, display: 'day'), notice: "Modification réussie !"
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: "Rendez-vous supprimé !"
  end

  private

  def set_params
    @day = params[:jd].present? ? Date.jd(params[:jd].to_i) : Date.today
    year = (params[:year].to_i if params[:year].to_i.positive?) || Date.today.year
    month = (params[:month].to_i if (1..12).include?(params[:month].to_i)) || Date.today.month
    @current_month = Date.new(year, month, 1)

    case params[:display]
    when 'week'
      @days = @day.beginning_of_week(:monday)..@day.end_of_week(:monday)
      @appointments = Appointment.where(user: current_user, date: @days)
    else # when 'day' or default
      @appointments = Appointment.where(user: current_user, date: @day.all_day)
    end
  end

  def set_appointment
    if Appointment.exists?(params[:id])
      @appointment = Appointment.find params[:id]
    else
      redirect_to appointments_path
      return
    end
  end

  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time, :reason, :summary, :patient_id)
  end
end
