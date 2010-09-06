package WWW::Google::Contacts::InternalTypes;

BEGIN {
    $WWW::Google::Contacts::InternalTypes::VERSION = '0.12';
}

use MooseX::Types -declare => [
    qw(
      XmlBool
      Rel
      When
      )
];

use MooseX::Types::Moose qw(Str Bool);

class_type Rel, { class => 'WWW::Google::Contacts::Type::Rel' };

coerce Rel, from Str, via {
    require WWW::Google::Contacts::Type::Rel;
    WWW::Google::Contacts::Type::Rel->new( ( $_ =~ m{^http} )
        ? ( uri => $_ )
        : ( name => $_ ),
    );
};

subtype XmlBool, as Bool;

coerce XmlBool, from Str, via {
    return 1 if ( $_ =~ m{^true$}i );
    return 0;
};

class_type When, { class => 'WWW::Google::Contacts::Type::When' };

coerce When, from Str, via {
    require WWW::Google::Contacts::Type::When;
    WWW::Google::Contacts::Type::When->new( start_time => $_ );
};

__END__

=pod

=head1 NAME

WWW::Google::Contacts::InternalTypes

=head1 VERSION

version 0.12

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
