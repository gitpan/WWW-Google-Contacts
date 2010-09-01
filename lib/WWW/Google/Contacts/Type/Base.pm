package WWW::Google::Contacts::Type::Base;

BEGIN {
    $WWW::Google::Contacts::Type::Base::VERSION = '0.11';
}

use Moose;

extends 'WWW::Google::Contacts::Base';

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=pod

=head1 NAME

WWW::Google::Contacts::Type::Base

=head1 VERSION

version 0.11

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
