require 'spec_helper'

describe "ZooKeeper setup" do
  describe file('/opt/zookeeper/conf/') do
    it { should be_directory }
  end

  describe file('/opt/zookeeper/conf/zoo.cfg') do
    its(:content) { should include("tickTime=#{ANSIBLE_VARS.fetch('zookeeper_tick_tiem', 'FAIL')}") }
  end
end
