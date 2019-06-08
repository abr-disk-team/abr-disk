class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def index
  	@users = User.all
  end

  def another_address
  end
end
