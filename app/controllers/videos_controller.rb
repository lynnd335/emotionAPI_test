class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
   # before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]


  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end



  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
    # Splices videos into frames (for each second)
    # movie = FFMPEG::Movie.new("/Users/nicolai/code/projects/emotionAPI_test/public/mark_zuck.mp4")
    # movie.transcode("movie.mp4", "-r 1 /Users/nicolai/code/projects/emotionAPI_test/public/test2/image-%04d.jpeg") { |progress| puts progress } # 0.2 ... 0.5 ... 1.0
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
 def create
    # Make an object in your bucket for your upload
    obj = S3_BUCKET.objects[params[:video].original_filename]

    # Upload the file
    obj.write(
      file: params[:video],
      acl: :public_read
    )

    # Create an object for the upload
    @video = Video.new(
            url: obj.public_url,
            name: obj.key
        )

    # Save the upload
    if @video.save
      redirect_to uploads_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

  # def set_s3_direct_post
  #   @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:time_length, :video_file, :video)
    end
end
