class LocationReviewsController < ApplicationController
  before_action :set_location_review, only: %i[ show edit update destroy ]

  # GET /location_reviews or /location_reviews.json
  def index
    @location_reviews = LocationReview.all
  end

  # GET /location_reviews/1 or /location_reviews/1.json
  def show
  end

  # GET /location_reviews/new
  def new
    @location_review = LocationReview.new
  end

  # GET /location_reviews/1/edit
  def edit
  end

  # POST /location_reviews or /location_reviews.json
  def create
    @location = Location.find(params[:location_id]) 
    @location_review = @location.location_reviews.build(location_review_params)

    respond_to do |format|
      if @location_review.save
        format.html { redirect_to location_url(@location), notice: "Thanks for your help!  Location review was successfully created." }
        format.json { render :show, status: :created, location: @location_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_reviews/1 or /location_reviews/1.json
  def update
    respond_to do |format|
      if @location_review.update(location_review_params)
        format.html { redirect_to location_review_url(@location_review), notice: "Location review was successfully updated." }
        format.json { render :show, status: :ok, location: @location_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_reviews/1 or /location_reviews/1.json
  def destroy
    @location_review.destroy

    respond_to do |format|
      format.html { redirect_to location_reviews_url, notice: "Location review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_review
      @location_review = LocationReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_review_params
      params.require(:location_review).permit(:author_name, 
                                              :author_url, 
                                              :profile_url, 
                                              :rating, 
                                              :text, 
                                              :time, 
                                              :type, 
                                              :location_id)
    end
end
