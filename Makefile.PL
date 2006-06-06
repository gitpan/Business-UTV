#!/usr/bin/perl -w

use strict;
use ExtUtils::MakeMaker;

my $install_bin = prompt( "Do you wish to install the gnome2 applet?" , "n" );
my @bins = ();

my @libs = ( "Test::MockObject" , "Test::Warn" , "Test::NoWarnings" , "LWP" , "Net::SSLeay" , "URI::Escape" );

if( $install_bin =~ /y/i )
{
	push(@libs , "Gtk2::TrayIcon" , "POSIX" );
	push(@bins , "bin/utv_usage_applet.pl" );
}


WriteMakefile(
        NAME            => "Business::UTV",
        VERSION_FROM    => "lib/Business/UTV.pm",
	AUTHOR		=> "Peter Sinnott link\@redbrick.dcu.ie",
	EXE_FILES	=> \@bins,
	PREREQ_PM	=> { map { $_ => 0 } @libs },
	LICENSE		=> "perl"
);
