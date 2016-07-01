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

    # cookies[:user_name] = "david"

    # render inline: 'слово "success";\nимя Cookie;\nзначение Cookie.'
    render inline: "success"

    # respond_to do |format|
    #   if @favorite_list_item.save
    #     format.html { redirect_to @favorite_list_item, notice: 'Favorite list item was successfully created.' }
    #     format.json { render :show, status: :created, location: @favorite_list_item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @favorite_list_item.errors, status: :unprocessable_entity }
    #   end
    # end

  end
end
