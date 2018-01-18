#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub steps {
    my @offsets = @{shift @_};
    my $mut = \&{shift @_};

    my $steps = 0;
    my $inc = 0;
    for (my $i = 0; $i <= $#offsets && $i >=0; $i += $inc) {
        $steps++;
        $inc = $offsets[$i];
        $offsets[$i] = $mut->($offsets[$i]);
    }
    return $steps;
}

sub main {
    my @offsets;
    while (<>) {
        chomp;
        push @offsets, $_;
    }

    # Part 1
    say steps(\@offsets, sub { 1 + shift });

    # Part 2
    say steps(\@offsets, sub { my $x = shift; $x >= 3 ? $x - 1 : $x + 1 });
}

exit main();