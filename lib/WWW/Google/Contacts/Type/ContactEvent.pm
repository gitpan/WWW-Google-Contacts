package WWW::Google::Contacts::Type::ContactEvent;

BEGIN {
    $WWW::Google::Contacts::Type::ContactEvent::VERSION = '0.06';
}

use Moose;
use MooseX::Types::Moose qw( Str );
use WWW::Google::Contacts::InternalTypes qw( Rel When );
use WWW::Google::Contacts::Meta::Attribute::Trait::XmlField;

extends 'WWW::Google::Contacts::Type::Base';

has type => (
    isa       => Str,            # not a full url rel :-/
    is        => 'rw',
    traits    => ['XmlField'],
    xml_key   => 'rel',
    predicate => 'has_type',
    coerce    => 1,
);

has when => (
    isa       => When,
    is        => 'rw',
    traits    => ['XmlField'],
    xml_key   => 'gd:when',
    predicate => 'has_when',
    coerce    => 1,
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=pod

=head1 NAME

WWW::Google::Contacts::Type::ContactEvent

=head1 VERSION

version 0.06

=head1 AUTHORS

=over 4

=item *

Fayland Lam <fayland@gmail.com>

=item *

Magnus Erixzon <magnus@erixzon.com>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Fayland Lam.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__
