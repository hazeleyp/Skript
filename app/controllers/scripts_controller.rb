class ScriptsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_script, only: %i[ show edit update destroy ]

  # GET /scripts or /scripts.json
  def index
    @scripts = Script.all
  end

  # GET /scripts/1 or /scripts/1.json
  def show
    @step = @script.steps.build
  end

  # GET /scripts/new
  def new
    @script = current_user.scripts.build
  end

  # GET /scripts/1/edit
  def edit
  end

  # POST /scripts or /scripts.json
  def create
    @script = current_user.scripts.build(script_params)

    respond_to do |format|
      if @script.save
        format.html { redirect_to @script, notice: "Script was successfully created." }
        format.json { render :show, status: :created, location: @script }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scripts/1 or /scripts/1.json
  def update
    respond_to do |format|
      if @script.update(script_params)
        format.html { redirect_to @script, notice: "Script was successfully updated." }
        format.json { render :show, status: :ok, location: @script }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scripts/1 or /scripts/1.json
  def destroy
    @script.destroy
    respond_to do |format|
      format.html { redirect_to scripts_url, notice: "Script was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script
      @script = current_user.scripts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def script_params
      params.require(:script).permit(:name, :description, :status, :context, :version, :owningApp)
    end
end
