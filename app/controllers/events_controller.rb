class EventsController < ApplicationController

  # GET /events/index
  # GET /events
  def index
    @events = Event.page( params[:page]).per(10)

    respond_to do |format|
      format.html
      format.xml {
        render :xml => @events.to_xml
      }
      format.json{
        render :json => @events.to_json
      }
      format.atom {
        @feed_title = "My event list"
      }
    end
  end

  #GET /events/show/:id
  def show
    @event = Event.find(params[:id])

    @page_title = @event.name
    respond_to do |format|
      format.html {@page_title = @event.name}
      format.xml
      format.json {render :json => {id: @event.id, name: @event.name, created_time: @event.created_at }.to_json }
    end
  end
  #GET /events/new
  def new
    @event = Event.new
  end

  #post /events/creat
  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "新增成功"
      redirect_to events_path
    else
      render :action => :new
    end
  end

  def edit
      @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "编辑成功"
      redirect_to event_path(@event)
    else
      render :action => :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy
    flash[:notice] = "删除成功"
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:name, :description)
  end
end
