# NOTE: Derived from lib/Text/CSV/International.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Text::CSV::International;

#line 165 "lib/Text/CSV/International.pm (autosplit into lib/auto/Text/CSV/International/parse.al)"
################################################################################
# parse
#
#    object method returning success or failure.  the given argument is expected
#    to be a valid comma-separated value.  failure can be the result of
#    no arguments or an argument containing an invalid sequence of characters.
#    side-effects include:
#      setting status()
#      setting fields()
#      setting string()
#      setting error_input()
################################################################################
sub parse {
  my $self = shift;
  $self->{'_STRING'} = shift;
  $self->{'_FIELDS'} = undef;
  #$self->{'_ERROR_INPUT'} = $self->{'_STRING'};
  $self->{'_STATUS'} = 0;
  if (!defined($self->{'_STRING'})) {
    return $self->{'_STATUS'};
  }
  my $keep_biting = 1;
  my $palatable = 0;
  my $line = $self->{'_STRING'};
  if ($line =~ /\n$/) {
    chop($line);
    if ($line =~ /\r$/) {
      chop($line);
    }
  }
  my $mouthful = '';
  my @part = ();
  while ($keep_biting and ($palatable = $self->_bite(\$line, \$mouthful, \$keep_biting))) {
    push(@part, $mouthful);
  }
  if ($palatable) {
    $self->{'_ERROR_INPUT'} = undef;
    $self->{'_FIELDS'} = \@part;
  }
  return $self->{'_STATUS'} = $palatable;
}

# end of Text::CSV::International::parse
1;
