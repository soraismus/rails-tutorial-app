class ChannelsController < ApplicationController
  before_action :signed_in_user

  def create
    contact = User.find_by_name(params[:chat][:contact])
    data = {
      cuid: current_user.id,
      contactId: contact.id
    }
    render json: data
  end

  def destroy
  end

end
