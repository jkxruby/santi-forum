class WelcomeController < ApplicationController
  def index
    flash[:notice]="danger,goodmorning"
  end
end
