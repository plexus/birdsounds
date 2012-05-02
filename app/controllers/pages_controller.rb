class PagesController < ApplicationController
  def home
    @sounds = Birdsound.random(5)
  end
end
