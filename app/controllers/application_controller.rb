class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #protect_from_forgery with: :exception

  def listener_1c
    # return render inline: request.headers.inspect
    log = OneCLog.create({
                       # request_headers: "request.headers.to_json",
                       request_params: params.as_json,
                       request_url: params[:args]} )

    cookies[:company] = "star_bud"

    # render inline: 'слово "success";\nимя Cookie;\nзначение Cookie.'
    if params['mode'] == 'auth'
      auth
    elsif params['mode'] == 'init'
      init
    else
      render inline: "something else"
    end

  end

  def auth
    render inline: "success\ncompany\nstarbud"
  end

  def init
    render inline: "zip=yes\nfile_limit=#{1024*100}"
  end
end
