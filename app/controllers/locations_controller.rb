class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]

  # GET /locations or /locations.json
  def index
    # @locations = Location.all
    # search tracking
    if params[:search].present?
      # parse city from state
      search_term = "#{params[:search]}"
# 
      city = nil
      state = nil

      match = search_term.match(/\b([A-Z]{2})\b/)
      if match
        state = match[1]
        search_term = search_term.gsub(/\b#{state}\b/, '').strip
      end

      comma_index = search_term.rindex(",")
      if comma_index
        city = search_term[0...comma_index].strip
        state ||= search_term[comma_index+1..-1].strip
      else
        city = search_term.strip
      end

# 
      @locations = Location.where(city: city, state: state)
    else
      @locations = Location.first(12)
    end

    # @pagy, @locations = pagy(Location.all)
  end

  # GET /locations/1 or /locations/1.json
  def show
    @review = @location.location_reviews.new
  end

  # GET /locations/new
  # def new
  #   @location = Location.new
  # end

  # GET /locations/1/edit
  # def edit
  # end

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
