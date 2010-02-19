
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'WWW::Google::Contacts',
                       'DISTNAME' => 'WWW-Google-Contacts',
                       'AUTHOR' => 'Fayland Lam <fayland@gmail.com>',
                       'ABSTRACT' => 'Google Contacts Data API',
                       'EXE_FILES' => [],
                       'VERSION' => '0.04',
                       'LICENSE' => 'perl',
                       'PREREQ_PM' => {
                                        'Net::Google::AuthSub' => '0',
                                        'LWP::UserAgent' => '0',
                                        'ExtUtils::MakeMaker' => '6.11',
                                        'XML::Simple' => '0'
                                      }
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



