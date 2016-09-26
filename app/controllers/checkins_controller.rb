class CheckinsController < ApplicationController
  before_action :set_checkin, only: [:show, :edit, :update, :destroy]

  # GET /checkins
  # GET /checkins.json
  def index
    @checkins = Checkin.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@checkins) do |checkin, marker|
      marker.lat checkin.latitude
      marker.lng checkin.longitude
      marker.infowindow render_to_string(partial: "/maps/map_box", locals: { checkin: checkin })
    end
  end

  # GET /checkins/1
  # GET /checkins/1.json
  def show
  end

  # GET /check_ins/new
  def new
    @checkin = Checkin.new
  end

  # GET /checkins/1/edit
  def edit
  end

  # POST /checkins
  # POST /checkins.json
  def create
    @checkin = Checkin.new(checkin_params)
    if @checkin.save
      redirect_to map_path, notice: 'Checkin was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /checkins/1
  # PATCH/PUT /checkins/1.json
  def update
    if @checkin.update(checkin_params)
      redirect_to @checkin, notice: 'Checkin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /checkins/1
  # DELETE /checkins/1.json
  def destroy
    @checkin.destroy
    respond_to do |format|
      format.html { redirect_to checkins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkin_params
      params.require(:checkin).permit(:name, :address, :user_id, :description)
    end
end
