# NOTE: Derived from lib/Text/CSV/International.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Text::CSV::International;

#line 64 "lib/Text/CSV/International.pm (autosplit into lib/auto/Text/CSV/International/status.al)"
################################################################################
# status
#
#    object method returning the success or failure of the most recent combine()
#    or parse().  there are no side-effects.
################################################################################
sub status {
  my $self = shift;
  return $self->{'_STATUS'};
}

# end of Text::CSV::International::status
1;
