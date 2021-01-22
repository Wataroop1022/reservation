class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :image))
    if @room.save
      flash[:notice] = "Room was successfully created."
      redirect_to "/rooms/#{@room.id}"
    else
      render "new"
    end
  end

  def show
  end

  def posts
  end

  def search
    if params[:area]
      @rooms = Room.search_area(params[:area])
    elsif params[:keyword]
      @rooms = Room.search_keyword(params[:keyword])
    end
    @rooms_count = @rooms.count
  end

end
