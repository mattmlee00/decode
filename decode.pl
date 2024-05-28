#!/usr/bin/perl
  use warnings;
  use strict;

  my $input_file = $ARGV[0]
     or die "usage: $0 <input file> <output file>\n";

  my $output_file = $ARGV[1]
     or die "usage: $0 <input file> <output file>\n";

  my $count = 1;
  my @pyramid = '';

  open(INPUT, $input_file) or die ("Could not open INPUT file.");
  open(OUTPUT, '>', $output_file) or die ("Could not open OUTPUT file."); 

  foreach my $line (<INPUT>) {
    next if($line =~ /^\s*$/);
    my @parts = split( /^\s+(*SKIP)(*F)|\s+/, $line);
    s/\s+\z// for @parts;
    s/\s+$// for @parts;

    my $index = $parts[0];
    $pyramid[$index] = $parts[1] . " ";

    $count = $count + 1; 

  }  

my $i = 1; #current_counter
my $j = 3; #target_number
my $k = 3; #index modifier for next target

for(@pyramid) {
    if($i == 1) {
      print OUTPUT $pyramid[$i];
      print OUTPUT " ";
      $i = $i + 1;

    }
    elsif($i == $j) {
      print OUTPUT $pyramid[$i];
      print OUTPUT " ";
      $i = $i + 1;
      $j = $j + $k;
      $k = $k + 1;
    }
    else {
      $i = $i + 1; 
    }
} 
