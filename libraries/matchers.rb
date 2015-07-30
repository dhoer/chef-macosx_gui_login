if defined?(ChefSpec)
  def run_macosx_gui_login(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:macosx_gui_login, :run, resource_name)
  end
end
