class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #protect_from_forgery with: :exception
  require 'open-uri'

  def listener_1c

    # download = open('/bitrix/admin/1c_exchange.php?type=catalog&mode=file&filename=import0_1.xml')
    # file_data = File.read(params[:filename].tempfile)


    # puts "test: #{params[:url]}"

    # FileUtils.mkdir_p('accounting_imports')
    # file_path = "accounting_imports/import-#{Time.current.strftime('%F--%H-%M-%S')}.xml"
    # IO.copy_stream(download, Rails.root + file_path)
    # OneCLog.new(request_url: file_path).save!


    @log = OneCLog.create({
                       # attachment_file: open(params[:filename]),
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
    # render inline: "something"
  end

  def auth
    render inline: "success\ncompany\nstarbud"
  end

  def init
    render inline: "zip=no\nfile_limit=#{1024 * 50}"
  end

  def file

    #@log.attachment_file =

    puts "request.body.inspect START"
    puts request.body.inspect
    puts "request.body.inspect END"
    render inline: "file"
  end


end
