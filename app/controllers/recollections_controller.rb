class RecollectionsController < ApplicationController

  def new
    @recollection = Recollection.new
  end

end
