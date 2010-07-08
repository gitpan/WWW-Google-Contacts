package WWW::Google::Contacts::Type::Email;

BEGIN {
    $WWW::Google::Contacts::Type::Email::VERSION = '0.06';
}

use Moose;
use MooseX::Types::Moose qw( Str );
use WWW::Google::Contacts::InternalTypes qw( Rel XmlBool );
use WWW::Google::Contacts::Meta::Attribute::Trait::XmlField;

extends 'WWW::Google::Contacts::Type::Base';

has type => (
    isa       => Rel,
    is        => 'rw',
    traits    => ['XmlField'],
    xml_key   => 'rel',
    predicate => 'has_type',
    coerce    => 1,
);

has value => (
    isa       => Str,
    is        => 'rw',
    traits    => ['XmlField'],
    xml_key   => 'address',
    predicate => 'has_value',
    required  => 1,
);

has display_name => (
    isa       => Str,
    is        => 'rw',
    traits    => ['XmlField'],
    xml_key   => 'displayName',
    predicate => 'has_display_name',
);

has label => (
    isa       => Str,
    is        => 'rw',
    traits    => ['XmlField'],
    xml_key   => 'label',
    predicate => 'has_label',
);

has primary => (
    isa       => XmlBool,
    is        => 'rw',
    traits    => ['XmlField'],
    predicate => 'has_primary',
    xml_key   => 'primary',
    to_xml =>
      sub { my $val = shift; return "true" if $val == 1; return "false" },
    default => sub { 0 },
    coerce  => 1,
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=pod

=head1 NAME

WWW::Google::Contacts::Type::Email

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
