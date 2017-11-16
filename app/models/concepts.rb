require 'Clarifai'
class Concepts
  def initialize(app_key,image_url,type="byte")
    @app_key = app_key
    @image_url = image_url
    if type == "byte"
      @request = Clarifai.new(app_key,"general",image_url).body_byte
    else
      @request = Clarifai.new(app_key,"general",image_url).body
    end
  end

  def concepts
    @request.values[1][0]["data"]["concepts"]
  end

  def labels
    self.concepts.map{|label|label["name"]}
  end
end
