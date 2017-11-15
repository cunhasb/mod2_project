require 'Clarifai'
class Demographics
  def initialize(app_key,image_url)
    @app_key = app_key
    @image_url = image_url
    @request = Clarifai.new(app_key,"demographics",image_url).body
  end
  def demographics
    @request.values[1][0]["data"].values[0][0]["data"].values[0]
  end

  def age
    self.demographics["age_appearance"]["concepts"]
  end

  def gender
    self.demographics["gender_appearance"]["concepts"]
  end

  def multicultural
    self.demographics["multicultural_appearance"]["concepts"]
  end

end