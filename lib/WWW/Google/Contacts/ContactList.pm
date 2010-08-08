package WWW::Google::Contacts::ContactList;

BEGIN {
    $WWW::Google::Contacts::ContactList::VERSION = '0.09';
}

use Moose;
use WWW::Google::Contacts::Contact;

extends 'WWW::Google::Contacts::Base';

with 'WWW::Google::Contacts::Roles::List';

sub baseurl       { 'http://www.google.com/m8/feeds/contacts/default' }
sub element_class { 'WWW::Google::Contacts::Contact' }

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=pod

=head1 NAME

WWW::Google::Contacts::ContactList

=head1 VERSION

version 0.09

=head1 SYNOPSIS

    use WWW::Google::Contacts;

    my $google = WWW::Google::Contacts->new( username => "your.username", password => "your.password" );

    my $contacts = $google->contacts;

    while ( my $cont = $contacts->next ) {
       print "You got a friend called " . $cont->full_name . "\n";

       if ( $cont->photo->exist ) {
          print "And you got a photo of this friend\n";
          $contact->photo->to_file( "/tmp/photo.jpg" );
       }
    }

=head1 METHODS

=head2 $contacts->next

Returns the next L<WWW::Google::Contacts::Contact> object

=head2 $contacts->search( $args )

B<WARNING> This is quite slow at the moment, at least if you've got a lot of contacts.

Given search criteria, will return all your contacts that matches critera.

 my @bastards = $contacts->search({
    given_name => "George",
    family_name => "Bush",
 });

B<TODO>: Speed up. Make search arguments more flexible ( AND / OR / Regex / ... ). Also, doubt that search on random things like IM addresses work right now..

=head1 AUTHOR

  Magnus Erixzon <magnus@erixzon.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Magnus Erixzon / Fayland Lam.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

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
