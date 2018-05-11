class VideosController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  def index
    @videos = Video.all
  end

  def new
    @video = current_user.videos.build
  end

  def create
    @video = Video.new video_params
    if @video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def show
    @video = Video.find params[:id]
    @video.increment!(:views)
  end

  private
  def video_params
    params.require(:video).permit :user_id, :name, :description, :video
  end
end
