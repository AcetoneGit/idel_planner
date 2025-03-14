class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
    @appointments = Appointment.all
  end

  def new
    @report = Report.new
  end

  def create
    @appointments = Appointment.all
    @report = Report.new(report_params)
    if @report.save
      redirect_to @report, notice: "Rapport créé avec succès."
    else
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to @report, notice: "Rapport mis à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_url, notice: "Rapport supprimé avec succès."
  end
end
