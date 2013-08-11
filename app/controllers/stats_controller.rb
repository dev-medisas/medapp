class StatsController < ApplicationController
  before_filter :load_patient
  before_filter :load_stat, :only => [:edit, :update, :show]
  def index
    @stats = @patient.stats
  end

  def new
    @stat = @patient.stats.build
  end

  def create
    @stat = @patient.stats.build(params[:stat])

    respond_to do |format|
      if @stat.save
        format.html { redirect_to patient_stat_path(@patient, @stat), notice: 'Stats were successfully saved.' }
        format.json { render json: @stat, status: :created, location: @stat }
      else
        format.html { render action: "new" }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @stat.update_attributes(params[:stat])
        format.html { redirect_to patient_stat_path(@patient, @stat), notice: 'Stats were successfully updated.' }
        format.json { render json: @stat, status: :created, location: @stat }
      else
        format.html { render action: "edit" }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end
  
  private
  def load_patient
    @patient = Patient.find(params[:patient_id])
  end

  def load_stat
    @stat = @patient.stats.where(:id => params[:id]).first
  end
end