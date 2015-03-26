class RoomsController < ApplicationController
  def new
  end

  def edit
  end

  def show
  end

  def index
  	@rooms = Room.all
  end
end
