# Copyright (C) 2014-2016 VMware, Inc.
require 'pathname'
vmware_module = Puppet::Module.find('vmware_lib', Puppet[:environment].to_s)
require File.join vmware_module.path, 'lib/puppet/property/vmware'

Puppet::Type.newtype(:nsx_vxlan_scope) do
  @doc = 'Manage NSX VXLAN Network Scopes.'

  ensurable do
    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end

    defaultto(:present)
  end

  newparam(:name, :namevar => true) do
    desc 'switch name'
    newvalues(/\w/)
  end

  newproperty(:clusters, :parent => Puppet::Property::VMware_Hash) do
    desc 'network scope name'
    newvalues(/\w/)
  end

  newparam(:datacenter_name, :parent => Puppet::Property::VMware) do
    newvalues(/\w/)
  end

  newparam(:cluster_name, :parent => Puppet::Property::VMware) do
    newvalues(/\w/)
  end

  autorequire(:nsx_vxlan_multicast) do
    self[:name]
  end

  autorequire(:transport) do
    self[:name]
  end

end
