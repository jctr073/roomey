class RoomsController < ApplicationController
  def new
    @room = current_user.rooms.build
  end

  def create
    
    sel_amenities = params[:room][:amenities]
    @room = current_user.rooms.build(room_params)
    if @room.save
      sel_amenities.each do |id|
        @room.amenities << Amenity.find(id.to_i) unless id.empty?
      end
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
    @rooms = Room.paginate(page: params[:page]).where(nil)
    @rooms = @rooms.paginate(page: params[:page]) \
                   .contains(params[:search_string]) \
                   if params[:search_string].present?
  	@rooms = @rooms.paginate(page: params[:page]) \
                   .neighborhood(params[:neighborhood]) \
                   if params[:neighborhood].present?
    @rooms = @rooms.paginate(page: params[:page]) \
                   .max_price(params[:max_price]) \
                   if params[:max_price].present?
  end

  private
    def room_params
      params.require(:room).permit(:short_desc, :price, 
                                   :description, :size, 
                                   :neighborhood_id)
    end
end
