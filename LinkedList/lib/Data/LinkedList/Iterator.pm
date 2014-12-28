package Data::LinkedList::Iterator;

use 5.006;
use strict;
use warnings FATAL => 'all';
use parent qw/Class::Accessor/;
__PACKAGE__->mk_accessors(qw/list p/);

=head1 NAME

Data::LinkedList::Iterator - iterator for Data::LinkedList's object.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

You can see Data::LinkedList module's SYNOPSIS as a example.

=cut

=head1 SUBROUTINES/METHODS

=head2 new

constructor. Any arguments don't require.

=cut

sub new {
    my ($class, $self) = @_;
    $self->{'p'} = $self->header;
    bless $self => $class;
    return $self;
}

=head2 has_next

return boolean value(1 or 0).
If the linkedList has next cell, this method return 1.
If the linkedList has not next cell, this method return 0.

=cut

sub has_next {
    my $self = shift;
    return defined $self->p->next ? 1 : 0;
}

=head2 next

return next cell(Data::LinkedList::Cell) of the LinkedList.

=head3 caution

If next method called, iterator progresses next cell.
So you should generally call has_next method and next method alternately each once respectively.

    my $list = Data::LinkedList->new;
    my $iter = $list->iterator;
    while ($iter->has_next) {
       print $iter->next->data . "\n";
    }

=cut

sub next {
    my $self = shift;
    if ( ! defined($self->p->next) ) {
        return undef;
    }

    $self->p($self->p->next);
    return $self->p->data;
}

=head1 AUTHOR

Shinchi Takahiro, C<< <shinchi.xx at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-datastructure-linkedlist at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Data-LinkedList>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Data::LinkedList::Iterator


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

1; # End of Data::LinkedLis::Iterator

