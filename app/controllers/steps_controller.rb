class StepsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_script
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  # GET scripts/1/steps
  def index
    @steps = @script.steps
  end

  # GET scripts/1/steps/1
  def show
  end

  # GET scripts/1/steps/new
  def new
    @step = @script.steps.build
  end

  # GET scripts/1/steps/1/edit
  def edit
  end

  # POST scripts/1/steps
  def create
    @step = @script.steps.build(step_params)

    if @step.save
      redirect_to(@step.script)
    else
      render action: 'new'
    end
  end

  # PUT scripts/1/steps/1
  def update
    if @step.update_attributes(step_params)
      redirect_to(@step.script)
    else
      render action: 'edit'
    end
  end

  # DELETE scripts/1/steps/1
  def destroy
    @step.destroy

    redirect_to @script
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script
      @script = Script.find(params[:script_id])
    end

    def set_step
      @step = @script.steps.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def step_params
      params.require(:step).permit(:name, :description, :expectedOutcome, :status, :testUser, :testDepartment, :linkedIssue, :dateTested, :script_id)
    end
end
