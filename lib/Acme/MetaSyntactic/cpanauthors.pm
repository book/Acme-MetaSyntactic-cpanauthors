package Acme::MetaSyntactic::cpanauthors;

use strict;
use Acme::MetaSyntactic::MultiList;
use Acme::CPANAuthors;
our @ISA     = qw( Acme::MetaSyntactic::MultiList );

__PACKAGE__->init(
    {   default => ':all',
        names   => {
            map {
                $_ => map { tr/-/_/; $_ } join ' ',
                    Acme::CPANAuthors->new($_)->id
                } Acme::CPANAuthors->_list_categories()
        }
    }
);

1;
