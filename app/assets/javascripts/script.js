window.onload = function () {
    //document.forms[0].username.focus();
    //$('#search_all_select').focus();
    $(function () {
        $("#search_string").focus();
    });

    // live filter of the page
    $('#search_string').keyup(function () {
        //alert($('input').get(3).innerHTML);

        // restore all results prior to the search
        $(".searchable").css('display', '');
        $('.chzn-search input').val($('#search_string').val());

        if ($('#search_string').val().length > 2) {
            $(".searchable").css('display', 'none');
            $('.panel-insert-table tr.collapse').next().show();


            $(function () {
                var search = $('#search_string').val().toLowerCase();
                var searchArray = search.split(', ');
                for (var i = 0; i < searchArray.length; i++) {
                    $(".searchable").filter(function () {

                        return $(this).text().toLowerCase().indexOf(searchArray[i]) != -1;

                    }).css('display', '');
                }
            });
        }

        // restore all results prior to the search
        $(".panel").css('display', '');


        if ($('#search_string').val().length > 2) {
            $(".panel").css('display', 'none');


            $(function () {
                var search = $('#search_string').val().toLowerCase();
                var searchArray = search.split(', ');
                for (var i = 0; i < searchArray.length; i++) {
                    $(".panel").filter(function () {

                        return $(this).text().toLowerCase().indexOf(searchArray[i]) != -1;

                    }).css('display', '');
                }
            });
        }


        //alert(selectBox);
        //if ( event.which == 13 ) {
        //alert("test");
        // event.preventDefault();
        // $('form#search-all').submit();
        // }
    });

    // tool tip
    $(function () {
        $(".tooltip").tipTip({
            defaultPosition: "top",
            edgeOffset: 8
        });
    });


//    $(".chosen").chosen({
//        allow_single_deselect: true
//    });
//
//    $('.panel-insert-table tr.collapse').next().hide();
//    Collapsable Panels
//    $('.panel-insert-table tr.collapse').toggle(function () {
//        $(this).next().show();
//    }, function () {
//        $(this).next().hide();
//    });


//    $(function() {
//        $('.category').hoverIntent(
//            function () {
//                $(this).find('.dropdown_menu_list_wrapper').fadeIn(600);
//
//            },
//            function () {
//
//                $(this).find('.dropdown_menu_list_wrapper').fadeOut(600);
//
//            }
//        );
//    });

    $('.window-item-parent').click(
        function () {
            // get rid of any old ones first
//            $('.dropdown_menu_list_wrapper').fadeOut(300);

            $(this).children('.dropdown_menu_list_wrapper').fadeIn(600);

        }
    );

    $('.dropdown_menu_list_wrapper').mouseleave(
        function () {
            $(this).fadeOut(600);

        }
    );

} // end on document load