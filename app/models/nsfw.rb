require 'Clarifai'
class NSFW
  def initialize(app_key,image_url)
    @app_key = app_key
    @image_url = image_url
    @request = Clarifai.new(app_key,"nsfw",image_url).body
  end

  def nsfw_name
    @request.values[1][0]["data"]["concepts"][0]["name"]
  end

  def nsfw?
    if nsfw_name == "sfw"
      false
    else
      true
    end
  end

end
