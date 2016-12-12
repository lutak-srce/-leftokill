# Class: leftokill::params
#
# This module contains defaults for leftokill modules
#
class leftokill::params {
  $ensure           = 'present'
  $version          = undef
  $status           = 'enabled'
  $file_mode        = '0644'
  $file_owner       = 'root'
  $file_group       = 'root'
  $dependency_class = 'leftokill::dependency'
  $my_class         = undef

  # install package depending on major version
  case $::osfamily {
    default: {}
    /(RedHat|redhat|amazon)/: {
      $package           = 'leftokill'
      $service           = 'leftokill'
      $config_file       = '/etc/leftokill/leftokill.conf'
    }
  }

  $conf_template = 'leftokill/leftokill.conf.erb'

  # General Section
  $general = {
    'KillEverySec' => 300,
    'NoExecute' => 'True',
    'LogMode' => 'Syslog, File',
    'ExcludeUsers' => '',
    'ExcludeProcesses' => '',
  }

  # Report Section
  $report = {
    'Send' => 'False',
    'Node' => $::fqdn,
    'To' => 'root@localhost',
    'From' => 'leftokill@localhost',
    'SMTP' => 'localhost',
    'SMTPLogin' => '',
    'SMTPPass' => '',
    'EveryHours' => 24,
  }

}
