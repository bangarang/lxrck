class SessionsController < Clearance::SessionsController
  def url_after_destroy
    tags_path
  end
end