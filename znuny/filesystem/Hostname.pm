package Kernel::Config::Files::Hostname;

use strict;
use warnings;
no warnings 'redefine';
use utf8;

sub Load {
    my ($File, $Self) = @_;
	$Self->{'FQDN'} =  'serviceup.com.br';
	    return;
}
1;
