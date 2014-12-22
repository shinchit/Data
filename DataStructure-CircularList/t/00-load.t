#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'DataStructure::CircularList' ) || print "Bail out!\n";
}

diag( "Testing DataStructure::CircularList $DataStructure::CircularList::VERSION, Perl $], $^X" );
