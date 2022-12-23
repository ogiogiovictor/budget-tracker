class SplashsController < ApplicationController
  def index; end

  def confirmation
    render template: 'splashs/confirmation'
  end
end
