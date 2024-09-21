class FamiliesController < ApplicationController
  def index
    @user = current_user
    @profile = @user.profile
    @children = current_user.children
    @invitation = Invitation.new
  end
end
