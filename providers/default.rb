def whyrun_supported?
  true
end

use_inline_resources

action :run do
  converge_by('run mac_os_x gui login') do
    if platform_family?('mac_os_x')
      privacy_services_manager 'allow remote login' do
        service 'accessibility'
        user new_resource.username
        applications %w(/System/Library/CoreServices/RemoteManagement/ARDAgent.app
                        /usr/libexec/sshd-keygen-wrapper)
        admin true
      end

      execute 'switch to login window' do
        command 'sudo "/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend'
      end

      execute 'login to gui' do # ~FC009
        retries 10
        sensitive true
        command <<-EOF
          osascript -e '
          tell application "System Events"
            keystroke "#{new_resource.username}"
            keystroke return
            delay 3.0
            keystroke "#{new_resource.password}"
            delay 3.0
            keystroke tab
            keystroke return
            keystroke return
          end tell'
        EOF
      end
    else
      log('Resource macosx_gui_login is not supported on this platform!') { level :warn }
    end
  end
end
