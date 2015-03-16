jQuery(function ($) {
    $(document).ready(function () {
        // Easy way to create a rollover when you have control over the html of any image.
        $('.hover-img').hover(
		    function () {
		        imgSrc = $(this).attr('src').replace('_s1', '_s2');
		        $(this).attr('src', imgSrc);
		    },
		    function () {
		        imgSrc = $(this).attr('src').replace('_s2', '_s1');
		        $(this).attr('src', imgSrc);
		    }
	    );

        if ($('.ms-profileasseenby').length > 0) {
            // Wrap "As Seen By" dropdown in order to be styled
            $('.ms-profileasseenby select').wrap("<div class='ms-profileasseenby-ddl'/>");

            // Setup up "As Seen By" dropdown style and onchange event.
            $('.ms-profileasseenby select').each(function () {
                var title = "Everyone";
                if ($('option:selected', this).val() != '') title = $('option:selected', this).text();
                $(this)
                .css({ 'z-index': 10, 'opacity': 0, '-khtml-appearance': 'none' })
                .after('<span class="select">' + title + '</span>')
                .change(function () {
                    val = $('option:selected', this).text();
                    $(this).next().text(val);
                })
            });

            // "As Seen By" dropdown display set to 'none' prior to this js from running.  Show it after all is complete
            $('.ms-profileasseenby select').css('display', 'block');

            // Add extra break to put floating elements back in the flow
            $('.ms-profileasseenby').append('<br clear="all" />');
        }

        // Dynamically add cellpadding/cellspacing onto left column webpart zones 
        if ($('#ms-zone-left .s4-wpcell-plain').length > 0) {
            $('#ms-zone-left .s4-wpcell-plain').closest('table').attr('cellpadding', '0');
            $('#ms-zone-left .s4-wpcell-plain').closest('table').attr('cellspacing', '0');
        }

        // Dynamically add cellpadding/cellspacing onto right column webpart zones 
        if ($('#ms-zone-right .s4-wpcell-plain').length > 0) {
            $('#ms-zone-right .s4-wpcell-plain').closest('table').attr('cellpadding', '10');
            $('#ms-zone-right .s4-wpcell-plain').closest('table').attr('cellspacing', '10');
        }

        // Set default text for People search on mysite and handle onfocus
        var srchDefaultTxt = $('.txtSearchBox').attr('placeholder');
        $('.txtSearchBox').val(srchDefaultTxt);

        $('.txtSearchBox').focus(function () {
            var input = $(this);
            if (input.val() == srchDefaultTxt) {
                input.val("");
                input.removeClass("'placeholder'");
            }
        }).blur(function () {
            var input = $(this);
            if (input.val() == "" || input.val() == srchDefaultTxt) {
                input.val(srchDefaultTxt);
            }
        }).blur();

        // Who's Following Me webpart can't be styled so add class, so that it can be.
        if ($('.FM_Container').length > 0) {
            $('.FM_Container').parent().addClass('FM_Container_Parent');
        }

        $("#s4-workspace").height("-=50");
    });
});