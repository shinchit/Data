use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;
use lib qw(lib);

WriteMakefile(
    NAME             => 'Data::LinkedList',
    AUTHOR           => q{shinchit <shinchi.xx@gmail.com>},
    VERSION_FROM     => 'lib/Data/LinkedList.pm',
    ABSTRACT_FROM    => 'lib/Data/LinkedList.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Carp'            => 1.26,
        'Class::Accessor' => 0.34,
        'Scalar::Util'    => 1.23,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Data-LinkedList-*' },
);
