# == Class: role::global
#
# Full description of class role::global here.
#
class role::global {

  notify { 'logging something on the agent client run from role::global ':
    withpath => false; }

}
