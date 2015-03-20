class PatientsController < ApplicationController
  def index
    @patients = Patient.order(updated_at: :desc).page(params[:page])
    if params[:search].present?
      cond = 'first_name ilike :search or last_name ilike :search or phone like :search or email ilike :search'
      @patients = @patients.where(cond, search: "%#{params[:search]}%")
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    # we don't have clinic entity yet, but we will, so default clinic will be clinic 1
    @patient = Patient.new(patient_params.merge(clinic_id: 1))
    if @patient.save
      redirect_to patients_path, notice: 'Пациент добавлен успешно'
    else
      render :new
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Пациент отредактирован успешно'
    else
      render :edit
    end
  end

  def destroy
    Patient.find_by(id: params[:id]).try(:archive!)
    redirect_to :back
  end

  private 

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :patronymic, :dob, :email, :phone, :address, :diagnosis, :doctor_id)
  end

end
