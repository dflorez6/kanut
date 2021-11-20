// File to declare all Materialize.css Turbolinks 5 initializers

$(document).on('turbolinks:before-visit turbolinks:before-cache', function() {
    var elem, instance;
    elem = document.querySelector('#slide-out');
    if (elem) {
        instance = M.Sidenav.getInstance(elem);
    }
    if (instance) {
        if (instance.isOpen) {
            instance.close();
        }
        return instance.destroy();
    }
});

$(document).on('turbolinks:before-visit turbolinks:before-cache', function() {
    return $('.toast').remove();
});

// Sidenav
$(document).on('turbolinks:load', function() {
    var elem, instance;
    elem = document.querySelector('#slide-out');
    if (elem) {
        return instance = new M.Sidenav(elem, {});
    }
});

// Components
$(document).on('turbolinks:load', function() {
    Waves.displayEffect();
    M.Modal._count = 0;
    M.ScrollSpy._count = 0;
    $('.modal').modal();
    $('.carousel').carousel();
    $('.collapsible').not('.expandable').collapsible();
    $('.collapsible.expandable').collapsible({
        accordion: false
    });
    $('.tap-target').tapTarget();
    $('.slider').slider();
    $('.parallax').parallax();
    $('.materialboxed').materialbox();
    $('.scrollspy').scrollSpy();
    $('.datepicker').datepicker();
    $('.timepicker').timepicker();
    $('.tooltipped').tooltip();
    $('.dropdown-trigger').dropdown( {hover: false} );
    // $('.dropdown-trigger').dropdown( {hover: true} );
    M.updateTextFields();
    $('select').not('.disabled').formSelect();
    $('input.autocomplete').autocomplete({
        data: {
            'Apple': null,
            'Microsoft': null,
            'Google': 'http://placehold.it/250x250'
        }
    });
    $('input[data-length], textarea[data-length]').characterCounter();
    $('.tabs').tabs();
    if ($('#tabs-swipe-demo').length) {
        $('#tabs-swipe-demo').tabs({
            'swipeable': true
        });
    }
    $(document.body).on('click', '.chip .close', function() {
        var $chips;
        $chips = $(this).closest('.chips');
        if ($chips.length && $chips[0].M_Chips) {
            return;
        }
        return $(this).closest('.chip').remove();
    });
    $('.chips').chips();
    $('.chips-initial').chips({
        readOnly: true,
        data: [
            {
                tag: 'Apple'
            }, {
                tag: 'Microsoft'
            }, {
                tag: 'Google'
            }
        ]
    });
    $('.chips-placeholder').chips({
        placeholder: 'Enter a tag',
        secondaryPlaceholder: '+Tag'
    });
    $('.chips-autocomplete').chips({
        autocompleteOptions: {
            data: {
                'Apple': null,
                'Microsoft': null,
                'Google': null
            }
        }
    });
    $('.fixed-action-btn').floatingActionButton();
    $('.fixed-action-btn.horizontal').floatingActionButton({
        direction: 'left'
    });
    $('.fixed-action-btn.click-to-toggle').floatingActionButton({
        direction: 'left',
        hoverEnabled: false
    });
    $('.fixed-action-btn.toolbar').floatingActionButton({
        toolbarEnabled: true
    });
    return console.log("load init on ready or turbolinks:load");
});