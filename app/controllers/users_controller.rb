class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @search = @user.surveys.search(params[:search])
    @surveys = @search.all
  end
end
