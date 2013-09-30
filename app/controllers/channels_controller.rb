class ChannelsController < ApplicationController
  before_action :signed_in_user

  def create
    cuid = current_user.id
    contact = User.find_by_name(params[:chat][:contact])
    channel_name = "/cxn-#{cuid}-#{contact.id}"
    @cu_channel = current_user.channels.build(name: channel_name)
    @cu_channel.save!

    uri = URI.parse("http://localhost:9292/mount")
    message = {
      channel: "/infrastructure-#{cuid}",
      data: channel_name
    }
    Net::HTTP.post_form(uri, :message => message.to_json)

    render nothing: true
  end

  def destroy
  end

end
