package WWW::Google::Contacts::Type::Rel;

BEGIN {
    $WWW::Google::Contacts::Type::Rel::VERSION = '0.09';
}

use Moose;
use MooseX::Types::Moose qw( Str );
use WWW::Google::Contacts::Meta::Attribute::Trait::XmlField;

extends 'WWW::Google::Contacts::Type::Base';

use constant SCHEME => 'http://schemas.google.com/g/2005';

has name => (
    isa        => Str,
    is         => 'ro',
    lazy_build => 1,
);

has uri => (
    isa        => Str,
    is         => 'ro',
    traits     => ['XmlField'],
    xml_key    => 'rel',
    predicate  => 'has_uri',
    lazy_build => 1,
);

sub _build_name {
    my $self = shift;
    die "No URI" unless $self->uri;
    unless ( $self->uri =~ m{\#(\.*)$} ) {
        die "Can't parse uri: " . $self->uri;
    }
    return $1;
}

sub _build_uri {
    my $self = shift;
    return sprintf( "%s#%s", SCHEME, $self->name );
}

sub to_xml_hashref {
    my $self = shift;
    return $self->uri;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=pod

=head1 NAME

WWW::Google::Contacts::Type::Rel

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

__END__
