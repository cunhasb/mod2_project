class Clarifai
  require 'net/http'
  require 'uri'
  require 'json'
  attr_accessor :app_key,:model,:image_path
  # attr_reader :g_uri, :request

  def initialize(app_key, model, image_path)
    @app_key = app_key
    @model = model
    @image_path = image_path
  end

 # APP_KEY = "f40ee57ffed14e4a8ff5f7d165a34be8"
# builds the url of the model based on the model name
# https://api.clarifai.com/v2/models/<MODEL_NAME_ID>/outputs
# byebug
def g_uri
models = {
  apparel: "e0be3b9d6a454f0493ac3a30784001ff",
  celebrity: "e466caa0619f444ab97497640cefc4dc",
  color: "eeed0b6733a644cea07cf4c60f87ebb7",
  demographics: "c0c0ac362b03416da06ab3fa36fb58e3",
  face_detection: "a403429f2ddf4b49b307e318f00e528b",
  face_embedding: "d02b4508df58432fbb84e800597b8959",
  focus: "c2cf7cecd8a6427da375b9f35fcd2381",
  food: "bd367be194cf45149e75f01d59f77ba7",
  general: "aaa03c23b3724a16a56b629203edc62c",
  general_embedding: "bbb5f41425b8468d9b7a554ff10f8581",
  logo: "c443119bf2ed4da98487520d01a0b1e3",
  moderation: "d16f390eb32cad478c7ae150069bd2c6",
  nsfw: "e9576d86d2004ed1a38ba0cf39ecb4b1",
  travel: "eee28c313d69466f836ab83287a54ed9",
  wedding: "c386b7a870114f4a87477c0824499348"
}
 "https://api.clarifai.com/v2/models/#{models[model.to_sym]}/outputs"
end
def request
   uri = URI.parse(self.g_uri)
request = Net::HTTP::Post.new(uri)
request.content_type = "application/json"
request["Authorization"] = "Key #{self.app_key}"
request.body = JSON.dump({
  "inputs" => [
    {
      "data" => {
        "image" => {
          "url" => "#{self.image_path}"
          # "url" => "https://samples.clarifai.com/metro-north.jpg"
        }
      }
    }
  ]
})

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end
end
def response
  self.request.code
end

def body
  JSON.parse(self.request.body)
end



# key = Param.first.app_key
#
# metro = "https://samples.clarifai.com/metro-north.jpg"
# angelina = "http://cdn.playbuzz.com/cdn/11572c25-3aa8-41c5-8fef-795de51e4346/ee72093c-3c01-433a-8d25-701cca06c975.jpg"
#
# concept_call = Concepts.new(key,metro)
# demographics_call = Demographics.new(key,angelina)
# celebrity_call = Celebrity.new(key,angelina)
# general_call= Clarifai.new(key,model,image_url)

end
