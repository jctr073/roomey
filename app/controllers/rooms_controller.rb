class RoomsController < ApplicationController
  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = "Room Posted"
      redirect_to room_path(@room.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  	@room = Room.find(params[:id])
  end

  def index
  	@rooms = Room.paginate(page: params[:page])
  end

  private
    def room_params
      params.require(:room).permit(:short_desc, 
                                   :price, :description, :size, 
                                   :neighborhood_id)
    end
end
