class EventsController < ApplicationController
  before_filter :require_admin, :only=>[:new, :create, :destroy, :update]
  # GET /events
  # GET /events.json
  def index
    if current_user.role == "Admin"
      @events = Event.all
    else
      @events = current_user.events
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  def rank
    @event = Event.find(params[:id])

    if params[:suggestions]
      for suggestion in @event.suggestions

        ranking = Ranking.where(:suggestion_id => suggestion.id, :user_id => current_user.id).first

        if ranking
          if params[:suggestions][suggestion.id.to_i]
            ranking.position = params[:suggestions][suggestion.id.to_i]
          else
            ranking.position = 0
          end
          ranking.save
        else
          ranking = Ranking.create(:suggestion_id => suggestion.id, 
                                  :user_id => current_user.id, 
                                  :position => params[:suggestions][suggestion.id.to_s])
        end
      end
      redirect_to event_path(@event)
    end
  end
  
  def desc_rest
			Restaurant.all()
	end  
	helper_method :desc_rest
	
	def create_suggestions
		@event= Event.find(params[:id])

		for id in params[:restaurants][:restaurants]
			unless id.blank?
			restaurant = Restaurant.find(id)
			@event.restaurants<< restaurant
			end
		end	
		if @event.save
				respond_to do |format|
        format.html { redirect_to @event, notice: 'Restaurant added' }
        format.json { render json: @event, status: :created, location: @event }
				end
     else
				respond_to do |format|
        format.html { render action: "show" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
				end
     end
	end
	
  
end
