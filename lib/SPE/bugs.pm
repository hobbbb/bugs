package SPE::bugs;

use Dancer ':syntax';

my $settings = {
    script      => '/',
    tpl         => 'SPE.tpl',
    alias       => 'bugs',
    upload      => 1,
    sortable    => 1,
    title       => 'Баги / Доработки',
    fields      => [
        {
            name    => 'descr',
            type    => 'editor',
            descr   => 'Описание',
            in_list => 1,
            error   => sub { !length(shift) },
        },
    ],
};

any '/'            => sub { return SCM::SPE::main($settings, \%{params()}); };
any '/edit/:id/'   => sub { return SCM::SPE::edit($settings, \%{params()}); };
any '/del/:id/'    => sub { return SCM::SPE::del($settings, \%{params()}); };
any '/rearrange/'  => sub { return SCM::SPE::rearrange($settings, \%{params()}); };

true;
