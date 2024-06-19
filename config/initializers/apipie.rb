Apipie.configure do |config|
  config.app_name                = "Photostocksz"
  config.api_base_url            = ""
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.app_info["1.0"] = <<-DESC
    Welcome to Your API Documentation.
    This API provides access to user information and their respective photos.
    It supports CRUD operations for users and photos. User has already the JWT.

    You may check the github Readme for setting up.
  DESC
end
