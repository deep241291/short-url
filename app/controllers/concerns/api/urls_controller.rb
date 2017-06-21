class Api::UrlsController < Api::ApiController
  respond_to :html, :json
  before_action :set_url, only: [:show, :edit, :update, :destroy]
  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
    urls = {status: 200, urls: @urls, message: 'All url fetch successfully'}
    render json: urls
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    if @url
      urls = {status: 200, urls: @url, message: 'All url fetch successfully'}
    else
      urls = {status: 400, message: 'No record found'}
    end
    render json: urls
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)
      if @url.save
        urls = {status: 200, urls: urls, message: 'Url Created successfully'}
      else
        urls = {status: 400, urls: urls, message: 'Something went wrong!.'}
      end
    render json: urls
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
      if @url.update(url_params)
         urls = {status: 200, urls: urls, message: 'Url updated successfully'}
      else
        urls = {status: 400, urls: urls, message: 'Something went wrong!.'}
      end
      render json: urls
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
     if @url.destroy
        urls = {status: 200, urls: urls, message: 'Url Deleted successfully'}
      else
        urls = {status: 400, urls: urls, message: 'Something went wrong!.'}
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:url)
    end
end