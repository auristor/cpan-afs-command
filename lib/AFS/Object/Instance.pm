package AFS::Object::Instance;

use Moose;
use Carp;

extends qw(AFS::Object);

has q{_commands} => ( is => q{rw}, isa => q{HashRef}, default => sub { return {}; } );

sub getCommandIndexes {
    return sort keys %{ shift->_commands };
}

sub getCommands {
    return values %{ shift->_commands };
}

sub getCommand {
    return shift->_commands->{ shift(@_) };
}

sub _addCommand {
    my $self = shift;
    my $command = shift;
    defined( $command->index ) or croak q{Invalid command object};
    return $self->_commands->{ $command->index } = $command;
}

1;
