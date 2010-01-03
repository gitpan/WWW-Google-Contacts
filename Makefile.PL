
use strict;
use warnings;



use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'WWW-Google-Contacts',
  NAME      => 'WWW::Google::Contacts',
  AUTHOR    => "Fayland\ Lam\ \<fayland\@gmail\.com\>",
  ABSTRACT  => "Google\ Contacts\ Data\ API",
  VERSION   => '0.03',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "LWP::UserAgent" => '0',
    "Net::Google::AuthSub" => '0',
    "XML::Simple" => '0',
  },
  test => {TESTS => 't/*.t'}
);

