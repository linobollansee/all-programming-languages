# Puppet manifest
class hello {
  notify { 'Hello, World!':
    message => 'Hello, World!',
  }
}

include hello