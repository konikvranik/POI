# NOTE: Derived from lib/Text/CSV/International.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Text::CSV::International;

#line 86 "lib/Text/CSV/International.pm (autosplit into lib/auto/Text/CSV/International/string.al)"
################################################################################
# string
#
#    object method returning the result of the most recent combine() or the
#    input to the most recent parse(), whichever is more recent.  there are no
#    side-effects.
################################################################################
sub string {
  my $self = shift;
  return $self->{'_STRING'};
}

# end of Text::CSV::International::string
1;
