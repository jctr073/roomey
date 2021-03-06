class RoomsController < ApplicationController
  def new
    @room = current_user.rooms.build
  end

  def create
    
    selected_amenities      = params[:room][:amenities]
    selected_lifestyle_tags = params[:room][:lifestyle_tags]    
    @room = current_user.rooms.build(room_params)
    if @room.save
      selected_amenities.each do |id|
        @room.amenities << Amenity.find(id.to_i) unless id.empty?
      end
        selected_lifestyle_tags.each do |id|
        @room.lifestyle_tags << LifestyleTag.find(id.to_i) unless id.empty?
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
    @rooms = @rooms.contains(params[:search_string]) if params[:search_string].present?
  	@rooms = @rooms.neighborhood(params[:neighborhood]) if params[:neighborhood].present?
    @rooms = @rooms.max_price(params[:max_price]) if params[:max_price].present?
  end

  private
    def room_params
      params.require(:room).permit(:short_desc, :price, 
                                   :description, :size, 
                                   :neighborhood_id)
    end
end
