class LocationsController < ApplicationController
  before_action :set_location, only: %i[ edit show update destroy ]
# 
  def second_page
    
  end

  def third_page
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("content", partial: 'filler')
      end
    end
  end

  def index
    if params[:city].present?
      @locations = Location.where(city: params[:city]).where(state: params[:state])
      @location_pins = @locations.map{|f| {lat: f.lat, lng: f.lng, label: f.city, tooltip: "5 stars"}}
    else
      @locations = []
    end
  end

  def autocomplete
    @locations = Location.where("lower(city) LIKE ? OR lower(state) LIKE ?", "%#{params[:q].downcase}%", "%#{params[:q].downcase}%")
    render turbo_stream: turbo_stream.replace(
      "search-results",
      partial: "locations/autocomplete_results",
      locals: { locations: @locations }
    )
  end

  def search
    if params[:search].present?
@search_query = params[:search]
@locations = Location.where("city ILIKE ?", "%#{@search_query}%")
                     .group(:city, :state).count

    # @locations = Location.where('city ILIKE ?', "%#{params[:search]}%").distinct
    
    else
      @locations = []
    end
    
    respond_to do |format|
      format.turbo_stream do
          render turbo_stream:
            turbo_stream.update("search_results",
            partial: "locations/search_results",
            locals: { locations: @locations }
            )
      end
    end
  end  
  # def search
  #   search_value = params[:search]
  #   if search_value.present?
  #     city, state = search_value.split(", ")
  #     @locations = Location.where(city: city, state: state)
  #     render turbo_stream: turbo_stream.replace(
  #       "search-results",
  #       partial: "locations/search_results",
  #       locals: { locations: @locations }
  #     )
  #   end
  # end

# 
#   # search for city, state
#   def search
#     term = params[:term].downcase
#     cities = Location.select(:city, :state).distinct.where("lower(city) LIKE ?", "#{term}%")
#     render json: cities
#   end
#   # GET /locations or /locations.json
#   def index
#     # @locations = Location.all
#     # search tracking
#     if params[:search].present?
#       # parse city from state
#       search_term = "#{params[:search]}"
# # 
#       city = nil
#       state = nil

#       match = search_term.match(/\b([A-Z]{2})\b/)
#       if match
#         state = match[1]
#         search_term = search_term.gsub(/\b#{state}\b/, '').strip
#       end

#       comma_index = search_term.rindex(",")
#       if comma_index
#         city = search_term[0...comma_index].strip
#         state ||= search_term[comma_index+1..-1].strip
#       else
#         city = search_term.strip
#       end

# # 
#       @locations = Location.where(city: city, state: state)
#       @location_pins = @locations.map{|f| {lat: f.lat, lng: f.lng}}
#     else
#       @locations = Location.first(12)
#       @location_pins = @locations.map{|f| {lat: f.lat, lng: f.lng}}
#     end

#     # @pagy, @locations = pagy(Location.all)
#   end

  # GET /locations/1 or /locations/1.json
  def show
    @location = Location.find(params[:id])
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
  # GET /locations/new
  # def new
  #   @location = Location.new
  # end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations or /locations.json
  # def create
  #   @location = Location.new(location_params)

  #   respond_to do |format|
  #     if @location.save
  #       format.html { redirect_to location_url(@location), notice: "Location was successfully created." }
  #       format.json { render :show, status: :created, location: @location }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @location.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /locations/1 or /locations/1.json
  # def update
  #   respond_to do |format|
  #     if @location.update(location_params)
  #       format.html { redirect_to location_url(@location), notice: "Location was successfully updated." }
  #       format.json { render :show, status: :ok, location: @location }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @location.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /locations/1 or /locations/1.json
  # def destroy
  #   @location.destroy

  #   respond_to do |format|
  #     format.html { redirect_to locations_url, notice: "Location was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:street_number, 
                                        :street, 
                                        :postal_code, 
                                        :city, 
                                        :country, 
                                        :formatted_address, 
                                        :formatted_phone_number, 
                                        :international_phone_number, 
                                        :lat, 
                                        :lng, 
                                        :name, 
                                        :permanently_closed, 
                                        :photos, 
                                        :place_id, 
                                        :rating, 
                                        :types, 
                                        :region, 
                                        :reviews, 
                                        :google_url, 
                                        :vicinity, 
                                        :website)
    end
end
