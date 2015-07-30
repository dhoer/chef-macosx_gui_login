actions :run
default_action :run

attribute :username, kind_of: [String, NilClass], name_attribute: true
attribute :password, kind_of: [String, NilClass], required: true
