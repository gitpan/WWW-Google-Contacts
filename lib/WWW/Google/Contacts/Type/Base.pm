package WWW::Google::Contacts::Type::Base;

BEGIN {
    $WWW::Google::Contacts::Type::Base::VERSION = '0.14';
}

use Moose;

extends 'WWW::Google::Contacts::Base';

no Moose;
__PACKAGE__->meta->make_immutable;
1;
__END__
