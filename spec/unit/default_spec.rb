require 'spec_helper'

describe 'macosx_gui_login_test::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'mac_os_x',
      version: '10.10',
      step_into: ['macosx_gui_login']
    ).converge(described_recipe)
  end

  it 'adds accessibility' do
    expect(chef_run).to add_privacy_services_manager('allow remote login').with(
      service: 'accessibility',
      user: 'vagrant',
      applications: %w(/System/Library/CoreServices/RemoteManagement/ARDAgent.app
                       /usr/libexec/sshd-keygen-wrapper),
      admin: true
    )
  end

  it 'runs macosx_gui_login' do
    expect(chef_run).to run_macosx_gui_login('vagrant').with(password: 'vagrant')
  end

  it 'switches to login screen' do
    expect(chef_run).to run_execute('switch to login window').with(
      command: 'sudo "/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend'
    )
  end

  it 'executes macosx_gui_login' do
    expect(chef_run).to run_execute('login to gui').with(retries: 10, sensitive: false)
  end
end
