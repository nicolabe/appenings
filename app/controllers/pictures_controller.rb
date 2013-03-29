class PicturesController < ApplicationController
  def upload
    @appening = Appening.find(params[:appening_id])
    picture = Picture.new(params[:appening])
    @appening.pictures << picture

    respond_to do |format|
      if @appening.save
        flash.notice = "Picture uploaded!"
      else
        flash.alert = "Picture could not be uploaded!"
      end
      format.html { redirect_to appenings_path }
    end
  end

  def remove
    @appening = Appening.find(params[:appening_id])
    picture = @appening.pictures.find(params[:id])
    picture.destroy
    
    respond_to do |format|
      if @appening.save
        flash.notice = "Picture removed"
      else
        flash.alert = "Picture could not be removed"
      end
      format.html { redirect_to appenings_path }
    end
  end
end
