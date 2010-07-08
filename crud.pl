#!perl

use strict;
use warnings;
use Data::Dumper;

use WWW::Google::Contacts;

my $google = WWW::Google::Contacts->new(
    username => "magnus.erixzon",
    password => "vq.ab Kommer Vinna"
);
my $c = $google->new_contact;
$c->full_name("Aa test");
$c->email('test@gmail.com');
$c->create;

print Dumper $c->to_xml_hashref;

$c->phone_number(
    {
        type  => "work",
        value => "+4412345",
    }
);
$c->add_phone_number("+46987621");    # Gets default type = mobile
$c->update;

print Dumper $c->to_xml_hashref;
