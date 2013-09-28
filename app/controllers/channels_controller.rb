class ChannelsController < ApplicationController
  before_action :signed_in_user

  def create
    cuid = current_user.id
    contact = User.find_by_name(params[:chat][:contact])
    channel_name = "cxn-#{cuid}-#{contact.id}"
    @cu_channel = current_user.channels.build(name: channel_name).save!
    @contact_channel = contact.channels.build(name: channel_name).save!
    render "static_pages/chat"
  end

  def destroy
  end

end
