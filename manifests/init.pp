class vps_hostname (

  $hostname,

) {

  file { '/etc/init.d/hostname_vps':
    ensure  => file,
    content => template('vps_hostname/hostname_vps.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    notify  => Service['hostname_vps'],
  }

  service { 'hostname_vps':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => false,
    require    => File['/etc/init.d/hostname_vps']
  }
}
