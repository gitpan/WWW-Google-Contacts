package WWW::Google::Contacts::GroupList;

BEGIN {
    $WWW::Google::Contacts::GroupList::VERSION = '0.11';
}

use Moose;
use WWW::Google::Contacts::Group;

extends 'WWW::Google::Contacts::Base';

with 'WWW::Google::Contacts::Roles::List';

sub baseurl       { 'http://www.google.com/m8/feeds/groups/default' }
sub element_class { 'WWW::Google::Contacts::Group' }

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=pod

=head1 NAME

WWW::Google::Contacts::GroupList

=head1 VERSION

version 0.11

=head1 SYNOPSIS

    use WWW::Google::Contacts;

    my $google = WWW::Google::Contacts->new( username => "your.username", password => "your.password" );

    my $groups = $google->groups;

    while ( my $gr = $groups->next ) {
       print "You got a contact group called " . $gr->title . "\n";
    }

=head1 METHODS

=head2 $groups->next

Returns the next L<WWW::Google::Contacts::Group> object

=head2 $groups->search( $args )

B<WARNING> This is quite slow at the moment, at least if you've got a lot of contacts.

Given search criteria, will return all your contacts that matches critera.

 my @spam_groups = $groups->search({
   title => "Spam",
 });

B<TODO>: Speed up. Make search arguments more flexible ( AND / OR / Regex / ... ).

=head1 AUTHOR

  Magnus Erixzon <magnus@erixzon.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Magnus Erixzon / Fayland Lam.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=head1 AUTHORS

=over 4

=item *

Magnus Erixzon <magnus@erixzon.com>

=item *

Fayland Lam <fayland@gmail.com>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Fayland Lam.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__
