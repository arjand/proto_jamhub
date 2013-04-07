module ApplicationHelper
  def current_user
    @current_user
  end

  def logged_in?
    !!current_user
  end

  def client
    Soundcloud.new(:client_id => '0a23b49ceed6cf6deb4647b6dd05c746',
                  :client_secret => '305e69451b753e7740247559b9179e36',
                  :redirect_uri => 'https://github.com/thomashopkins/jh')
  end
end
