#
define company::account (
  $uid,
  $gid,
  $fullname,
  $home,
  $shell,
  $pubkey   = '',
  $password = '!'
) {

  user { $name:
    ensure     => present,
    uid        => $uid,
    gid        => $gid,
    comment    => $fullname,
    home       => $home,
    shell      => $shell,
    password   => $password,
    managehome => true,
    require    => Group[$name],
  }

  group { $name:
    ensure => present,
    gid    => $gid,
  }

  file { $home:
    ensure => directory,
    owner  => $uid,
    group  => $gid,
    mode   => '0700',
  }

  file { "${home}/.ssh":
    ensure  => directory,
    owner   => $uid,
    group   => $gid,
    mode    => '0700',
    require => User[$name],
  }

  file { "${home}/.ssh/authorized_keys":
    ensure  => present,
    purge   => true,
    owner   => $uid,
    group   => $gid,
    mode    => '0600',
    require => File["${home}/.ssh"],
    content => $pubkey,
  }
}

