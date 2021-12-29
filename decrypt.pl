#!/usr/bin/perl
use lib '/tmp/localperl/lib/perl5';
use Crypt::CBCeasy;
use Crypt::Blowfish;
sub decrypt {
  my $key = shift;
  $crypted = shift;
  return Blowfish::decipher($key, pack("H*", $crypted));
}
unless ($ARGV[0] && $ARGV[1]) {
  print "Usage: $0 'key' 'ciphertext'\n";
  exit 0;
}
print STDERR "Decrypting using CBC library ver: ", $Crypt::CBC::VERSION ."\n";
print decrypt(@ARGV), "\n";
