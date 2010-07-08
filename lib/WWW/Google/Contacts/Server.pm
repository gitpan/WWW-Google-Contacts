package WWW::Google::Contacts::Server;

BEGIN {
    $WWW::Google::Contacts::Server::VERSION = '0.06';
}

use MooseX::Singleton;
use LWP::UserAgent;
use Net::Google::AuthSub;
use Carp qw( croak );

has ua => (
    is      => 'ro',
    default => sub { LWP::UserAgent->new },
);

has authsub => (
    is         => 'ro',
    lazy_build => 1,
);

has username => (
    isa     => 'Str',
    is      => 'ro',
    default => sub { $ENV{GOOGLE_USERNAME} },
);

has password => (
    isa     => 'Str',
    is      => 'ro',
    default => sub { $ENV{GOOGLE_PASSWORD} },
);

has gdata_version => (
    isa     => 'Str',
    is      => 'ro',
    default => '3.0',
);

sub _build_authsub {
    my $self = shift;

    my $auth = Net::Google::AuthSub->new( service => 'cp' );
    my $res = $auth->login( $self->username, $self->password );
    unless ( $res and $res->is_success ) {
        croak "Authentication failed";
    }
    return $auth;
}

sub authenticate {
    my $self = shift;
    return 1 if ( $self->authsub );
}

sub get {
    my ( $self, $id ) = @_;
    my %headers = $self->authsub->auth_params;
    $headers{'GData-Version'} = $self->gdata_version;
    my $res = $self->ua->get( $id, %headers );
    unless ( $res->is_success ) {
        croak "GET failed: " . $res->status_line;
    }
    return $res;
}

sub post {
    my ( $self, $id, $content ) = @_;

    my %headers = $self->authsub->auth_params;
    $headers{'Content-Type'}  = 'application/atom+xml';
    $headers{'GData-Version'} = $self->gdata_version;
    my $res = $self->ua->post( $id, %headers, Content => $content );
    unless ( $res->is_success ) {

        #use Data::Dumper; print Dumper $res;
        croak "POST failed: " . $res->status_line;
    }
    return $res;
}

sub put {
    my ( $self, $id, $content ) = @_;

    my %headers = $self->authsub->auth_params;
    $headers{'Content-Type'}           = 'application/atom+xml';
    $headers{'GData-Version'}          = $self->gdata_version;
    $headers{'If-Match'}               = '*';
    $headers{'X-HTTP-Method-Override'} = 'PUT';
    my $res = $self->ua->post( $id, %headers, Content => $content );
    unless ( $res->is_success ) {
        croak "PUT failed: " . $res->status_line;
    }
    return $res;
}

sub delete {
    my ( $self, $id ) = @_;

    my %headers = $self->authsub->auth_params;
    $headers{'If-Match'}               = '*';
    $headers{'X-HTTP-Method-Override'} = 'DELETE';
    $headers{'GData-Version'}          = $self->gdata_version;
    my $res = $self->ua->post( $id, %headers );
    unless ( $res->is_success ) {
        croak "DELETE failed: " . $res->status_line;
    }
    return $res;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=pod

=head1 NAME

WWW::Google::Contacts::Server

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
