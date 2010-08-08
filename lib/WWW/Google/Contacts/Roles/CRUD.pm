package WWW::Google::Contacts::Roles::CRUD;

BEGIN {
    $WWW::Google::Contacts::Roles::CRUD::VERSION = '0.09';
}

use Moose::Role;
use Carp qw( croak );
use XML::Simple ();

use WWW::Google::Contacts::Server;

requires 'create_url';

has raw_data_for_backwards_compability => ( is => 'rw' );
has server =>
  ( is => 'ro', default => sub { WWW::Google::Contacts::Server->instance } );

sub as_xml {
    my $self  = shift;
    my $entry = {
        entry => {
            'xmlns'          => 'http://www.w3.org/2005/Atom',
            'xmlns:gd'       => 'http://schemas.google.com/g/2005',
            'xmlns:gContact' => 'http://schemas.google.com/contact/2008',
            %{ $self->to_xml_hashref },
        },
    };
    my $xmls = XML::Simple->new;

    my $xml = $xmls->XMLout( $entry, KeepRoot => 1 );
    return $xml;
}

sub create_or_update {
    my $self = shift;
    if ( $self->has_id ) {
        return $self->update;
    }
    else {
        return $self->create;
    }
}

sub create {
    my $self = shift;

    my $xml = $self->as_xml;
    my $res =
      $self->server->post( $self->create_url, undef, 'application/atom+xml',
        $xml );
    my $xmls = XML::Simple->new;
    my $data = $xmls->XMLin( $res->content, SuppressEmpty => undef );
    $self->set_from_server($data);
    1;
}

sub retrieve {
    my $self = shift;
    croak "No id set" unless $self->id;

    my $res  = $self->server->get( $self->id );
    my $xmls = XML::Simple->new;
    my $data = $xmls->XMLin( $res->content, SuppressEmpty => undef );
    $self->raw_data_for_backwards_compability($data);
    $self->set_from_server($data);
    $self;
}

sub update {
    my $self = shift;
    croak "No id set" unless $self->id;

    my $xml = $self->as_xml;
    $self->server->put( $self->id, $self->etag, 'application/atom+xml', $xml );
    $self;
}

sub delete {
    my $self = shift;
    croak "No id set" unless $self->id;

    $self->server->delete( $self->id, $self->etag );
    1;
}

1;

__END__

=pod

=head1 NAME

WWW::Google::Contacts::Roles::CRUD

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
