class DiagnosesController < ApplicationController
  def index
    @diagnoses = Diagnosis.order(name: :asc).page(params[:page])
    if params[:search].present?
      @diagnoses = @diagnoses.where('name ilike :search or description ilike :search', search: "%#{params[:search]}%")
    end
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    if @diagnosis.save
      redirect_to diagnoses_path, notice: 'Диагноз добавлен успешно'
    else
      render :new
    end
  end

  def edit
    @diagnosis = Diagnosis.find(params[:id])
  end

  def update
    @diagnosis = Diagnosis.find(params[:id])
    if @diagnosis.update(diagnosis_params)
      redirect_to diagnoses_path, notice: 'Диагноз отредактирован успешно'
    else
      render :edit
    end
  end

  def destroy
    Diagnosis.find_by(id: params[:id]).try(:destroy)
    redirect_to :back
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:name, :description)
  end
end

