package WWW::Google::Contacts::InternalTypes;

BEGIN {
    $WWW::Google::Contacts::InternalTypes::VERSION = '0.23';
}

use MooseX::Types -declare => [
    qw(
      XmlBool
      Rel
      When
      Method
      )
];

use MooseX::Types::Moose qw(Str Bool HashRef CodeRef Any);

subtype Method, as CodeRef;

coerce Method, from Any, via {
    sub { return $_ }
};

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
}, from HashRef, via {
    return undef unless defined $_->{startTime};
    require WWW::Google::Contacts::Type::When;
    WWW::Google::Contacts::Type::When->new(
        start_time => $_->{startTime},
        defined $_->{endTime} ? ( end_time => $_->{endTime} ) : (),
    );
};
