macosx_gui_login node['macosx_gui_login']['user'] do
  password node['macosx_gui_login']['user']
  sensitive false
end
