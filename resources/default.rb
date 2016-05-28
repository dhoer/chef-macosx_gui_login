actions :run
default_action :run

attribute :username, kind_of: [String, NilClass], name_attribute: true
attribute :password, kind_of: [String, NilClass], required: true

attribute :sensitive, kind_of: [TrueClass, FalseClass] # , default: true - see initialize below

# Chef will override sensitive back to its global value, so set default to true in init
def initialize(*args)
  super
  @sensitive = true
end
