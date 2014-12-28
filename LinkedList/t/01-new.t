# t/01-new.t
use strict;
use warnings;
use Test::More;
use Data::LinkedList;

my $list = Data::LinkedList->new;
isa_ok $list, 'Data::LinkedList';

done_testing;

