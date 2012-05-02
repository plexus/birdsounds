class BirdsoundsController < ApplicationController
  respond_to :json, :xml

  def show
    id = params[:id]
    birdsound = Birdsound.find_or_initialize_by_id(id)
    unless birdsound.persisted?
      birdsound.fetch_data!
    end
    respond_with birdsound
  end

  def random
    respond_with Birdsound.random(5)
  end
end
