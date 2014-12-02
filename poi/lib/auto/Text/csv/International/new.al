# NOTE: Derived from lib/Text/CSV/International.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Text::CSV::International;

#line 46 "lib/Text/CSV/International.pm (autosplit into lib/auto/Text/CSV/International/new.al)"
################################################################################
# new
#
#    class/object method expecting no arguments and returning a reference to a
#    newly created Text::CSV object.
################################################################################
sub new {
  my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self = {};
  $self->{'_STATUS'} = undef;
  $self->{'_ERROR_INPUT'} = undef;
  $self->{'_STRING'} = undef;
  $self->{'_FIELDS'} = undef;
  bless $self, $class;
  return $self;
}

# end of Text::CSV::International::new
1;
