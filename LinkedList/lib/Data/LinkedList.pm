package Data::LinkedList;

use 5.006;
use strict;
use warnings FATAL => 'all';
use Data::LinkedList::Cell;
use Data::LinkedList::Iterator;
use parent qw/Class::Accessor/;
__PACKAGE__->mk_accessors(qw/header/);

=head1 NAME

Data::LinkedList - simple implementation for using LinkedList data structure.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Data::LinkedList;

    my $list = Data::LinkedList->new;
    $list->insert(20);
    $list->insert(15);
    $list->insert(18);
    $list->insert(37);
    $list->insert(3);

    # display
    my $iter = $list->iterator;
    while ($iter->has_next) {
       print $iter->next->data . "\n";
    }
    # you can see result sorted
    # 3
    # 15
    # 18
    # 20
    # 37
    ...
    
    # you can also use strings as cells
    $list = Data::LinkedList->new;
    $list->insert('steeve');
    $list->insert('hisashi');
    $list->insert('Takairo');
    $list->insert('kazuyo');
    $list->insert('jane');
    
    # display
    $iter = $list->iterator;
    while ($iter->has_next) {
       print $iter->next->data . "\n";
    }
    # you can see result sorted
    # Takahiro
    # hisashi
    # jane
    # kazuyo
    # steeve
    ...

    # you can also use some object as cells
    use Person;
    $list = Data::LinkedList->new;
    $list->insert(Person->new(name => 'lally'));
    $list->insert(Person->new(name => 'hisashi'));
    $list->insert(Person->new(name => 'Takairo'));
    $list->insert(Person->new(name => 'kazuyo'));
    $list->insert(Person->new(name => 'jane'));
    
    # you have to implements compare_to method in you object.
    # you have to write sort logic in compare_to method.
    package Person;

    sub new {
        my $class = shift;
        my %args = @_;
        my $self = {
            name => $args{'name'},
            length => length($args{'name'}),
        };
        bless $self => $class;
        $self->length(length($args{'name'}));
        return $self;
    }

    # sort by length of name, and name
    sub compare_to {
        my $self = shift;
        my $cell = shift;

        if ($self->length > $cell->length) {
            return 1;
        } elsif ($self->length == $cell->length) {
            return $self->name gt $cell->name ? 1 : 0;
        } else {
            return 0;
        }
    }

    sub name {
        my $self = shift;
        return defined $self->{'name'} ? $self->{'name'} : undef;
    }

    sub length {
        my $self = shift;
        return defined $self->{'length'} ? $self->{'length'} : undef;
    }

=head1 DESCRIPTION

This module is simple implementation for using LinkedList data structure.
The cells inserted this LinkedList is sorted by value automatically.
If you want to sort by original logic, you have to make orignal class and implement compare_to method.
You can see SYNOPOSIS as a example;

=head2 FEATURES

- simple interface. The function is very little and how to use is easy to understand.
- You can use Orignal Object for a cell of LinkedList and implement Orignal sort logic by implementing compare_to method.

=cut

=head1 SUBROUTINES/METHODS

=head2 new

constructor. Any arguments don't require.

=cut

sub new {
    my ($class, %self) = @_;
    $self{'header'} = Data::LinkedList::Cell->new("!!List Header!");
    bless \%self => $class;
    return \%self;
}

=head2 insert($cell)

insert a cell on the linked list.
You can see SYNOPSIS as a example.


=cut

sub insert {
    my $self = shift;
    my $cell = Data::LinkedList::Cell->new(shift);

    my $p = $self->header->next;
    my $q = $self->header;
 
    while (defined($p) && $p->can('data') && $cell->compare_to($p->data) > 0) {
        $q = $p;
        $p = $p->next;
    }

    my $new_cell = Data::LinkedList::Cell->new($cell);
    $new_cell->next($p);
    $q->next($new_cell);
}

=head2 iterator

get a iterator to traverse the linked list.
You can see SYNOPSIS as a example.

=cut

sub iterator {
    my $self = shift;
    my $iter = Data::LinkedList::Iterator->new($self);
    return $iter;
}


=head1 AUTHOR

Shinchi Takahiro, C<< <shinchi.xx at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-datastructure-linkedlist at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Data-LinkedList>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SEE ALSO

L<LinkedList-Single>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Data::LinkedList


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Data-LinkedList>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Data-LinkedList>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Data-LinkedList>

=item * Search CPAN

L<http://search.cpan.org/dist/Data-LinkedList/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Shinchi Takahiro.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Data::LinkedList
