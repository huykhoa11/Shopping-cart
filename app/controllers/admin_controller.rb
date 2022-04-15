class AdminController < ApplicationController
	before_action :authenticate_user!, only: :index

  def index
  	@admin = current_user
  	@products = Product.all
  end
end
