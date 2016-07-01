class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #protect_from_forgery with: :exception

  def listener_1c

    @log = OneCLog.create({
                       # request_headers: "request.headers.to_json",
                       request_params: params.as_json,
                       request_url: params[:args]} )


    if params['mode'] == 'checkauth'
      auth
    elsif params['mode'] == 'init'
      init
    elsif params['mode'] == 'file'
      file
    else
      render inline: "something else"
    end

  end

  def auth
    render inline: "success\ncompany\nstarbud"
  end

  def init
    render inline: "zip=no\nfile_limit=#{1024 * 1000 * 100}"
  end

  def file
    #@log.attachment_file =
    puts "request.body.inspect START"
    puts request.body.inspect
    puts "request.body.inspect END"
    render inline: "file"
  end
end
