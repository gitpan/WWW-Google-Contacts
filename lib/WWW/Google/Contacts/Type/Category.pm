package WWW::Google::Contacts::Type::Category;

BEGIN {
    $WWW::Google::Contacts::Type::Category::VERSION = '0.07';
}

use Moose;
use MooseX::Types::Moose qw( Str );
use WWW::Google::Contacts::InternalTypes qw( Rel );
use WWW::Google::Contacts::Meta::Attribute::Trait::XmlField;

extends 'WWW::Google::Contacts::Type::Base';

has type => (
    isa       => Rel,
    is        => 'rw',
    traits    => ['XmlField'],
    xml_key   => 'scheme',
    predicate => 'has_type',
    coerce    => 1,
    required  => 1,
);

has term => (
    isa       => Rel,
    is        => 'rw',
    traits    => ['XmlField'],
    xml_key   => 'term',
    predicate => 'has_term',
    coerce    => 1,
    required  => 1,
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=pod

=head1 NAME

WWW::Google::Contacts::Type::Category

=head1 VERSION

version 0.07

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
