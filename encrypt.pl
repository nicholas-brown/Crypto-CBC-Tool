#!/usr/bin/perl
use Crypt::CBCeasy;
use Crypt::Blowfish;
sub encrypt {
  my $key = shift;
  my $plaintext = shift;
  my $crypted = Blowfish::encipher($key, $plaintext);
  return unpack("H*", $crypted);
}
unless ($ARGV[0] && $ARGV[1]) {
  print STDERR "Usage: $0 'key' 'plaintext'\n";
  exit 0;
}
open STDERR, '>/dev/null';
print "Using CBC library ver: ", $Crypt::CBC::VERSION ."\n";
print encrypt(@ARGV), "\n";
