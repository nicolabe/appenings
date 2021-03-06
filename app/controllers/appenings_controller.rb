class AppeningsController < ApplicationController
  # GET /appenings
  # GET /appenings.json
  def index
    @appenings = current_user.appenings.where(accomplished: false).sort("created_at desc")
    @accomplished_appenings = current_user.appenings.where(accomplished: true).sort("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appenings }
    end
  end

  # GET /appenings/1
  # GET /appenings/1.json
  def show
    @appening = Appening.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appening }
    end
  end

  # GET /appenings/new
  # GET /appenings/new.json
  def new
    @appening = Appening.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # GET /appenings/1/edit
  def edit
    @appening = current_user.appenings.find(params[:id])
  end

  # POST /appenings
  # POST /appenings.json
  def create
    @appening = Appening.new(params[:appening])
    @appening.user = current_user

    respond_to do |format|
      if @appening.save
        content = @appening.title
        feed_event = FeedEvent.create(user: current_user, content: content, type: "appening")
        current_user.friends.each do |friend_id|
          friend = User.find(friend_id)
          friend.feed_events << feed_event.id 
          friend.save
        end
        format.html { redirect_to "/appenings/", notice: 'Appening was successfully created.' }
        format.json { render json: @appening, status: :created, location: @appening }
      else
        format.html { redirect_to "/appenings/", alert: 'Appening could not be created, need content.' }
        format.json { render json: @appening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appenings/1
  # PUT /appenings/1.json
  def update
    @appening = Appening.find(params[:id])

    respond_to do |format|
      if @appening.update_attributes(params[:appening])
        format.html { redirect_to appenings_path, notice: 'Appening was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appenings/1
  # DELETE /appenings/1.json
  def destroy
    @appening = Appening.find(params[:id])
    @appening.destroy

    respond_to do |format|
      format.html { redirect_to appenings_url }
      format.json { head :no_content }
    end
  end

  def accomplish
    @appening = Appening.find(params[:id])
    @appening.accomplished = !@appening.accomplished
    @appening.save
    if @appening.accomplished
      flash.notice = "Congratulations, you've accomplished a goal!"
    else
      flash.notice = "Undid accomplishment (story and pictures will still be available)."
    end
    redirect_to appenings_path
  end

  def copy
    @appening = Appening.find(params[:id])
    copy_appening = @appening.dup
    copy_appening.comments.delete_all
    copy_appening.pictures.delete_all
    copy_appening.accomplished = false
    current_user.appenings << copy_appening
    redirect_to appenings_path, notice: "Good luck!"
  end

  def cancel
    @appening = Appening.find(params[:appening_id]) rescue nil
    @original_action = params[:original_action]

    respond_to do |format|
      format.js
    end
  end

  def story
    @appening = Appening.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end

  def feed
    @friends = current_user.friends.map {|friend| User.find(friend)}
    @appenings = @friends.map do |friend|
      friend.appenings.last
    end
  end
end
