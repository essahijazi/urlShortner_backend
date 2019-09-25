class UrlsController < ApplicationController

  def show
  end

  def shorten
    url = params[:originalURL]
    render json: {url: url}
  end

  private

  def shorten_url_helper(url)
    
  end

end
