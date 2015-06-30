require 'spec_helper'

describe 'chef-training::default' do
  let(:chef_run) do
    runner_params = {
      platform: 'redhat',
      version: '6.5'
    }
    ChefSpec::Runner.new(runner_params).converge(described_recipe)
  end

  it 'converges w/o fail' do
    expect {chef_run}.to_not raise_error
  end
end
