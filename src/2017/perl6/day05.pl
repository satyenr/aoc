#!/usr/bin/env perl6

use v6;

sub steps(@offsets is copy, $mut) {
    my $steps = 0;
    my $inc = 0;
    loop (my $i = 0; $i < @offsets.elems && $i >= 0; $i += $inc) {
        $steps++;
        $inc = @offsets[$i];
        @offsets[$i] = $mut(@offsets[$i]);
    }
    return $steps;
}

sub MAIN {
    my @offsets = slurp.chomp.split("\n");

    # Part 1
    say steps(@offsets, { $_ + 1 });

    # Part 2
    say steps(@offsets, { $_ >= 3 ?? $_ - 1 !! $_ + 1 });
}