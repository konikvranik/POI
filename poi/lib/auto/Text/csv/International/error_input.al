# NOTE: Derived from lib/Text/CSV/International.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Text::CSV::International;

#line 75 "lib/Text/CSV/International.pm (autosplit into lib/auto/Text/CSV/International/error_input.al)"
################################################################################
# error_input
#
#    object method returning the first invalid argument to the most recent
#    combine() or parse().  there are no side-effects.
################################################################################
sub error_input {
  my $self = shift;
  return $self->{'_ERROR_INPUT'};
}

# end of Text::CSV::International::error_input
1;
