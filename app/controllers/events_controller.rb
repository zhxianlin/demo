class EventsController < ApplicationController

  # GET /events/index
  # GET /events
  def index
    @events = Event.page( params[:page]).per(10)
  end

  #GET /events/show/:id
  def show
    @event = Event.find(params[:id])

    @page_title = @event.name
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
      redirect_to :action => :index
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
      redirect_to :action => :show, :id => @event
    else
      render :action => :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy
    flash[:notice] = "删除成功"
    redirect_to :action => :index
  end

  private
  def event_params
    params.require(:event).permit(:name, :description)
  end
end
