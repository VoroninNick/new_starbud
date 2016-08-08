class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  http_basic_authenticate_with name: "admin", password: "star_bud", only: [:listener_1c]

  #protect_from_forgery with: :exception
  require 'open-uri'

  def listener_1c
    @log = OneCLog.create({
                       # attachment_file: open(params[:filename]),
                       request_params: params.as_json,
                       request_url: params[:args]} )

    if params['mode'] == 'checkauth'
      auth
    elsif params['mode'] == 'init'
      init
    elsif params['mode'] == 'file'
      file_request
    elsif params['mode'] == 'import'
      file_receiving
    else
      render inline: "something else"
    end
  end

  def auth
    render inline: "success\ncompany\nstarbud\nsessid=#{session.id}"
  end

  def init
    render inline: "zip=yes\nfile_limit=#{200 * 1024}"
  end

  def file_request
    render inline: "success"
  end

  def file_receiving
    file_progress = session["file_progress"].try(&:to_i) || 0
    session["file_progress"] = file_progress + 1

    if file_progress <= 10
      render inline: "progress"
    else
      render inline: "success"
    end


    #@log.attachment_file =
    # puts "request.body.inspect START"
    # puts request.body.inspect
    # puts "request.body.inspect END"
    # render inline: "file"
  end


end
