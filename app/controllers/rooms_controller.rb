class RoomsController < ApplicationController
  def new
  end

  def edit
  end

  def show
  	@room = Room.find(params[:id])
  end

  def index
  	@rooms = Room.paginate(page: params[:page])
  end
end
