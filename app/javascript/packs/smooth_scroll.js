$(document).on('turbolinks:load', function() {
    // Smooth Scroll Menu Links for Fixed Navbar
    $('.menu-links a').click(function() {
        var  menuLinks = $(this).attr('href');
        $('body,html').animate({
                scrollTop: $(menuLinks).offset().top - 79 // Minus height of appearing navbar.
            },
            1000, 'swing'
        );
        return false;
    });

    // Smooth Scroll Menu Links for Hidden Navbar & Animation
    if (window.location.pathname === "/") {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 100 && NavBar.hidden) {
                NavBar.hidden = false;
                $('#hidden-menu-links').animate({ marginTop: '0' }, 500);
            } else if ($(this).scrollTop() <= 100 && !NavBar.hidden) {
                NavBar.hidden = true;
                $('#hidden-menu-links').animate({ marginTop: '-80px' }, 500);
            }
        });
    }

    // Projects Smooth Scroll (doesn't count navbar height)
    $('.projects-menu-links a').click(function() {
        var  menuLinks = $(this).attr('href');
        $('body,html').animate({
                scrollTop: $(menuLinks).offset().top - 0 // Minus height of appearing navbar.
            },
            1000, 'swing'
        );
        return false;
    });



});

var NavBar = {
    hidden: true
};