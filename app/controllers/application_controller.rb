class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #protect_from_forgery with: :exception

  def listener_1c
    # return render inline: request.headers.inspect
    log = OneCLog.create({
                       # request_headers: "request.headers.to_json",
                       request_params: params.to_json,
                       request_url: params[:args]} )

    render json: log
  end
end
