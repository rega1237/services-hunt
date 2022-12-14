class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]

  # GET /services or /services.json
  def index
    current_page = params[:page] || 1
    @services = Service.all.paginate(page: current_page, per_page: 12)
  end

  # GET /services/1 or /services/1.json
  def show
    @comments = @service.comments
  end

  # GET /services/new
  def new
    @service = Service.new
    authorize! :new, @service
  end

  # GET /services/1/edit
  def edit
    authorize! :edit, @service
  end

  # POST /services or /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to service_url(@service), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to service_url(@service), notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    current_page = params[:page] || 1
    @q = params[:q]
    @services = Service.where('lower(name) LIKE ?', "%#{@q.downcase}%").paginate(page: current_page, per_page: 12)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def service_params
    params.require(:service).permit(:name, :description, :image, category_ids: [])
  end
end
