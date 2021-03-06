class AppointmentsController < ApplicationController
  before_action :set_doctor

  def index
    @appointments = @doctor.appointments
  end

  def show
  end

  def new
    @users = User.all - @doctor.users
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else 
      render :new
    end
  end

  def destroy
    @doctor.appointments.find(params[:id]).destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  def edit
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date, :user_id)
  end

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end
end
