class Url < ActiveRecord::Base
  # validates_format_of :given_url, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

end
