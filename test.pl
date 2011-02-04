#!/usr/bin/perl -w

use strict;

use WWW::Google::Contacts;

my $user = $ARGV[0];    #.'@nhusd.k12.ca.us';
my $pass = $ARGV[1];

my $google = WWW::Google::Contacts->new( username => $user, password => $pass )
  or die("Can't log in...\n");
my @groups =
  $google->groups->search( { title => "System Group: My Contacts" } );
my $congrp = shift @groups;

my $new_contact = $google->new_contact;
$new_contact->full_name("Chris Hobbs");
$new_contact->email("chobbs\@nhusd.k12.ca.us");
$new_contact->add_group_membership($congrp);
$new_contact->notes("Welcome to Google!");
$new_contact->create;    #create works fine

my @contacts =
  $google->contacts->search( { full_name => "Any Name" } );    #throws error
