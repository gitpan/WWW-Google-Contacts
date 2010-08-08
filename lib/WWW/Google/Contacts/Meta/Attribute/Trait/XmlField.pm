package WWW::Google::Contacts::Meta::Attribute::Trait::XmlField;

BEGIN {
    $WWW::Google::Contacts::Meta::Attribute::Trait::XmlField::VERSION = '0.09';
}

use Moose::Role;

has xml_key => (
    isa      => 'Str',
    is       => 'ro',
    required => 1,
);

# Allow attributes to have custom code for transforming to xml
has to_xml => (
    isa       => 'CodeRef',
    is        => 'ro',
    predicate => 'has_to_xml',
);

has is_element => (
    isa     => 'Bool',
    is      => 'ro',
    default => sub { 0 },
);

has include_in_xml => (
    isa     => 'Bool',
    is      => 'ro',
    default => sub { 1 },
);

no Moose::Role;

package Moose::Meta::Attribute::Custom::Trait::XmlField;

BEGIN {
    $Moose::Meta::Attribute::Custom::Trait::XmlField::VERSION = '0.09';
}

sub register_implementation {
    'WWW::Google::Contacts::Meta::Attribute::Trait::XmlField';
}

1;

__END__

=pod

=head1 NAME

WWW::Google::Contacts::Meta::Attribute::Trait::XmlField

=head1 VERSION

version 0.09

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
