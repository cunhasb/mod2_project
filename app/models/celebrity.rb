require 'Clarifai'
class Celebrity
  def initialize(app_key,image_url,type="byte")
    @app_key = app_key
    @image_url = image_url
    if type == "byte"
      @request = Clarifai.new(app_key,"celebrity",image_url).body_byte
    else
      @request = Clarifai.new(app_key,"celebrity",image_url).body
    end

  end

  def celebrity
    @request.values[1][0]["data"].values[0][0]["data"].values[0]["identity"]["concepts"]
  end

  def celebrity_name
    self.celebrity.map{|celebrity|celebrity["name"]}
  end

end
