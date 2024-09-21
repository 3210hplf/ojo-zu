class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = current_user.invitations.build
    @invitation.expired_at = 1.week.from_now
    p @invitation
    if @invitation.save
      @invite_link = accept_invitation_url(token: @invitation.token)
      render :show_link
    else
      render :new
    end
  end
end
