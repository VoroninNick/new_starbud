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
                       request_url: params[:args],
                       session_id: session.id
                          } )

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
    post_source = request.raw_post
    text = post_source.force_encoding("UTF-8")
    post_source_encoding = post_source.encoding
               #.encode("UTF-8")

    Rails.logger.info("request.raw_post: " + text)
    Rails.logger.info("request.raw_post#encoding: " + post_source_encoding.name)
  end

  def auth
    render inline: "success\ncompany\nstarbud\n#{'_star_bud_new_session'}=#{session.id}"
  end

  def init
    render inline: "zip=yes\nfile_limit=#{200 * 1024}"
  end
  #
  # //Receive files
  # elseif (($_GET["mode"] == "file") && $ABS_FILE_NAME)
  # {
  #     //Read http data
  # if (function_exists("file_get_contents"))
  #   $DATA = file_get_contents("php://input");
  #   elseif (isset($HTTP_RAW_POST_DATA))
  #   $DATA = &$HTTP_RAW_POST_DATA;
  # else
  #   $DATA = false;
  #
  #   $DATA_LEN = defined("BX_UTF")? mb_strlen($DATA, 'latin1'): strlen($DATA);
  #   //And save it the file
  #   if (isset($DATA) && $DATA !== false)
  #     {
  #         CheckDirPath($ABS_FILE_NAME);
  #     if ($fp = fopen($ABS_FILE_NAME, "ab"))
  #       {
  #           $result = fwrite($fp, $DATA);
  #       if ($result === $DATA_LEN)
  #         {
  #             echo "success\n";
  #         if ($_SESSION["BX_CML2_IMPORT"]["zip"])
  #           $_SESSION["BX_CML2_IMPORT"]["zip"] = $ABS_FILE_NAME;
  #           }
  #         else
  #           {
  #               echo "failure\n",GetMessage("CC_BSC1_ERROR_FILE_WRITE", array("#FILE_NAME#"=>$FILE_NAME));
  #           }
  #           }
  #           else
  #           {
  #               echo "failure\n",GetMessage("CC_BSC1_ERROR_FILE_OPEN", array("#FILE_NAME#"=>$FILE_NAME));
  #           }
  #           }
  #           else
  #           {
  #               echo "failure\n",GetMessage("CC_BSC1_ERROR_HTTP_READ");
  #           }
  #           }
  def file_request
    render inline: "success"
  end

  def file_receiving
    file_progress = session["file_progress"].try(&:to_i) || 0
    session["file_progress"] = file_progress + 1

    if file_progress <= -1
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
