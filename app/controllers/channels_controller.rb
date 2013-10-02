class ChannelsController < ApplicationController
  before_action :signed_in_user

  def create
    contact = User.find_by_name(params[:chat][:contact])
    channel_name = "/cxn-#{current_user.id}-#{contact.id}"
    endpoints = [current_user, contact]

    # ActiveModel::Base.transaction do
    endpoints.each do |user|
      build_connection(user, channel_name)
    end

    render nothing: true
  end

  def destroy
    channels = Channel.where(name: params[:channel_name])
    channels.each { |ch| ch.destroy }
  end

  private

    def build_connection(user, channel_name)
      user.channels.build(name: channel_name).save!
      message = msg(user, channel_name)
      Net::HTTP.post_form(uri, message: message)
    end

    def msg(user, channel_name)
      msg = {}
      msg[:channel] = "/infrastructure-#{user.id}"
      msg[:data] = channel_name
      msg.to_json
    end

    def uri
      @uri ||= URI.parse(Rails.application.config.faye_url)
    end

end
