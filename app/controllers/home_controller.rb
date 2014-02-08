class HomeController < ApplicationController
  def welcome
    @restaurants = Restaurant.all
  end
end
