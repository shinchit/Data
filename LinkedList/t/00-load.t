#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Data::LinkedList' ) || print "Bail out!\n";
}

diag( "Testing Data::LinkedList $Data::LinkedList::VERSION, Perl $], $^X" );
