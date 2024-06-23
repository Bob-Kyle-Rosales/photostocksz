class Api::V1::BaseController < ApplicationController
  include Pagy::Backend
  include AuthenticateHelper
  include ExceptionHandler

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user
end
