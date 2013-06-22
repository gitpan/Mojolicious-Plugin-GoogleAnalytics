package Mojolicious::Plugin::GoogleAnalytics;

use strictures 1;
use Mojo::Base 'Mojolicious::Plugin';
use Mojo::ByteStream 'b';

our $VERSION = '0.002'; # VERSION

sub register {
    my ($self, $app) = @_;

    $app->helper(
        analytics => sub {
            my $c            = shift;
            my $analytics_id = shift;

            die "No analytics ID defined" unless defined $analytics_id;
            return b(<<"ENDANALYTICS");
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '${analytics_id}']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
ENDANALYTICS
        }
    );
}

1;
__END__

=head1 NAME

Mojolicious::Plugin::GoogleAnalytics - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('GoogleAnalytics');

  # Mojolicious::Lite
  plugin 'GoogleAnalytics';

  # In your layout template
  <%= analytics 'UA-32432-1' %>
  </head> <!-- Make sure its just before closing head tag -->


=head1 DESCRIPTION

L<Mojolicious::Plugin::GoogleAnalytics> is a L<Mojolicious> plugin. Inserts Google Analytics code and associates your analytics id.

=head1 METHODS

L<Mojolicious::Plugin::GoogleAnalytics> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
