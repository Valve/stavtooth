class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.order(updated_at: :desc).page(params[:page])
    if params[:search].present?
      cond = 'first_name ilike :search or last_name ilike :search or phone like :search or email ilike :search'
      @doctors = @doctors.where(cond, search: "%#{params[:search]}%")
    end
  end

  def new
    @doctor = Doctor.new
  end

  def create
    # we don't have clinic entity yet, but we will, so default clinic will be clinic 1
    @doctor = Doctor.new(doctor_params.merge(clinic_id: 1))
    if @doctor.save
      redirect_to doctors_path, notice: 'Доктор добавлен успешно'
    else
      render :new
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to doctors_path, notice: 'Доктор отредактирован успешно'
    else
      render :edit
    end
  end

  def destroy
    Doctor.find_by(id: params[:id]).try(:archive!)
    redirect_to :back
  end

  private 

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :patronymic, :dob, :email, :phone, :address)
  end

end
