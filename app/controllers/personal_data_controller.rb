class PersonalDataController < ApplicationController

  def index
    @all_personals = PersonalData.includes(:employment)
  end

  def new
    @personal_data = PersonalData.new
    @employments = Employment.all
  end

  def create
    @personal_data = PersonalData.new(personal_data_params)
    @all_personals = PersonalData.all 
    @employment = Employment.new
    respond_to do |format|
      if @personal_data.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('employment_modal', render_to_string('employments/new'), locals: @employment )
        end
      else
        format.html { render :index, flash: { danger: @personal_data.errors.full_messages.join(', ') } }
      end
    end
  end
  
  private
  
  def personal_data_params
    params.permit(:first_name, :last_name, :nickname, :email, :phone, :employment_id)
  end
end