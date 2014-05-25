package Acme::MetaSyntactic::cpanauthors;

use strict;
use Acme::MetaSyntactic::MultiList;
use Acme::CPANAuthors;
our @ISA = qw( Acme::MetaSyntactic::MultiList );

my %names = (
    map {
        $_ => map { tr/-/_/; lc $_ } join ' ', Acme::CPANAuthors->new($_)->id
        } Acme::CPANAuthors->_list_categories()
);

# protect against empty categories (Acme::CPANAuthors::Dutch)
delete $names{$_} for grep !$names{$_}, keys %names;

__PACKAGE__->init( { default => ':all', names => \%names } );

1;
