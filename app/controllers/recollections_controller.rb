class RecollectionsController < ApplicationController

  def new
    @recollection = Recollection.new
  end

  def create
    @recollection = Recollection.create(recollection_params)
    
  end


end
