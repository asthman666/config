#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;

unless ( -d '/tmp/emacs_config_backup' ) {
   mkdir '/tmp/emacs_config_backup'; 
}

my @now = localtime(time);
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
my $day = ($year-100).($mon+1).$mday.$hour.$min.$sec;

move("$ENV{HOME}/.emacs", "/tmp/emacs_config_backup/.emacs$day");

#move(".emacs", "$ENV{HOME}/.emacs");
copy("./.emacs", "$ENV{HOME}/.emacs");


