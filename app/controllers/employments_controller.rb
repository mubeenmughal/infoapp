class EmploymentsController < ApplicationController

  def new
    @employment = Employment.new
  end
  
  def create
    @employment = current_user.employments.build(employments_params)
    respond_to do |format|
      if @employment.save
        format.html { redirect_to personal_data_path }
      else
        format.html { redirect_to new_employment_path, flash: { danger: @employment.errors.full_messages.join(', ') }}  
      end
    end
  end
        
  private
  
  def employments_params
    params.permit(:employer, :date_started, :date_ended)
  end
end
