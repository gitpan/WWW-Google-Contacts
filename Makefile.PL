
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Google Contacts Data API",
  "AUTHOR" => "Magnus Erixzon <magnus\@erixzon.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "WWW-Google-Contacts",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "WWW::Google::Contacts",
  "PREREQ_PM" => {
    "Class::MOP" => "1.09",
    "Crypt::SSLeay" => 0,
    "File::Slurp" => 0,
    "LWP::UserAgent" => 0,
    "Moose" => 0,
    "MooseX::Role::Parameterized" => 0,
    "MooseX::Types" => 0,
    "Net::Google::AuthSub" => 0,
    "Perl6::Junction" => 0,
    "Try::Tiny" => 0,
    "XML::Simple" => 0
  },
  "VERSION" => "0.38",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



