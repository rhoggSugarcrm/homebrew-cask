cask 'vagrant186' do
  version '1.8.6'
  sha256 'b916cd103c91faf57b63b49188e4cd09136f81385ff05d62e55b68c87b53a2d9'

  # hashicorp.com/vagrant was verified as official when first introduced to the cask
  url "https://releases.hashicorp.com/vagrant/#{version}/vagrant_#{version}.dmg"
  name 'Vagrant'
  homepage 'https://www.vagrantup.com/'

  pkg 'Vagrant.pkg'

  uninstall script:  {
                       executable: 'uninstall.tool',
                       input:      %w[Yes],
                     },
            pkgutil: 'com.vagrant.vagrant'

  zap delete: '~/.vagrant.d'

  def caveats
    ["You should run: % vagrant plugin install vagrant-vbguest"]
  end
end
