# NOTE: Derived from lib/Text/CSV/International.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Text::CSV::International;

#line 98 "lib/Text/CSV/International.pm (autosplit into lib/auto/Text/CSV/International/fields.al)"
################################################################################
# fields
#
#    object method returning the result of the most recent parse() or the input
#    to the most recent combine(), whichever is more recent.  there are no
#    side-effects.
################################################################################
sub fields {
  my $self = shift;
  if (ref($self->{'_FIELDS'})) {
    return @{$self->{'_FIELDS'}};
  }
  return undef;
}

# end of Text::CSV::International::fields
1;
