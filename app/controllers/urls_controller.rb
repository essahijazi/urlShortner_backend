class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def shorten

    #checks if url has already been shortened
    shortened = Url.where(["original_url=?", params[:original_url]]).first
    

    if shortened
      #url HAS been shortened before, short url is returned
      render json: {short_url: shortened.short_url}
    else  
      Url.transaction do 
        #url HAS NOT been shortened before

        #create a new url instance so i can use it's id
        new_shortened = Url.new(original_url: params[:original_url])
        new_shortened.save

        #convert base 85 number into a unique string
        new_short_url = new_shortened.convert_base85_to_new_url

        #add the new short url to the url instane that was created
        new_shortened.short_url = new_short_url
        new_shortened.save

        #short url of new url instance is returned
        render json: {short_url: new_shortened.short_url}
      end
    end
  end
end
