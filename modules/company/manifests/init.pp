# == Class: company
#
# Full description of class company here.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
#
# === Authors
#
class company {

  create_resources('company::account', hiera_hash( 'companyusers', []))

  }
