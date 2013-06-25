requires "Mojo::Base" => "0";
requires "strictures" => "1";

on 'test' => sub {
  requires "Mojolicious::Lite" => "0";
  requires "Test::Mojo" => "0";
  requires "Test::More" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
};
