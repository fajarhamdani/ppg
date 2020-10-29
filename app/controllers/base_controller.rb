class BaseController < ApplicationController
  layout 'main'
  
  before_action :authenticate_user!
end
