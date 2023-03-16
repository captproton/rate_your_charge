class VisitsController < ApplicationController
  before_action :set_visit, only: %i[show edit update destroy]

  # GET /visits or /visits.json
  def index
    @visits = Visit.all.order(created_at: :desc).first(10)
  end

  # GET /visits/1 or /visits/1.json
  def show; end

  # GET /visits/new
  def new
    @visit = Visit.new
  end

  # GET /visits/1/edit
  def edit; end

  # POST /visits or /visits.json
  # def create
  #   @visit = current_user.visits.new(visit_params)

  #   respond_to do |format|
  #     if @visit.save
  #       format.html { redirect_to visit_url(@visit), notice: 'Visit was successfully created.' }
  #       format.json { render :show, status: :created, location: @visit }
  #       format.turbo_stream do
  #         render turbo_stream: turbo_stream.prepend(
  #           :visits,
  #           partial: 'visits/visit',
  #           locals: { visit: @visit }
  #         )
  #       end

  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @visit.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  ###
  # POST /visits or /visits.json
  def create
    return unless %w[upvote downvote].include?(visit_params[:vote_type])
    return if visit_params[:location_id].blank?

    # @location = Location.find(params[:location_id])
    # @location = Location.find(visit_params[:location_id]) || Location.last
    # @visit = @location.visits.create!(location: @location, user: current_user)
    @visit = current_user.visits.new(
      location_id: visit_params[:location_id],
      comment: visit_params[:comment]
    )

    respond_to do |format|
      if @visit.save!
        # @visit.vote!(visit_params[:vote_type], current_user)
        @visit.vote_by voter: current_user, vote: visit_params[:vote_type]
        format.html { redirect_to visit_url(@visit), notice: 'Visit was successfully created.' }
        format.json { render :show, status: :created, location: @visit }
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend(
            :visits,
            partial: 'visits/visit',
            locals: { visit: @visit }
          )
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  ###
  # PATCH/PUT /visits/1 or /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to visit_url(@visit), notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1 or /visits/1.json
  def destroy
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_visit
    @visit = Visit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def visit_params
    params.require(:visit).permit(:comment, :user_id, :location_id, :vote_type)
  end
end
