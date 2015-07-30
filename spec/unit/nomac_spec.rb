require 'spec_helper'

describe 'macosx_gui_login_test::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'ubuntu',
      version: '14.04',
      step_into: ['macosx_gui_login']
    ).converge(described_recipe)
  end

  it 'calls gui login on ubuntu platform' do
    expect(chef_run).to run_macosx_gui_login('vagrant')
      .with(password: 'vagrant')
  end

  it 'logs warning' do
    expect(chef_run).to write_log('Resource macosx_gui_login is not supported on this platform!')
  end
end
