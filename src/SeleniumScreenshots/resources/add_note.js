(function (selector, text, width, color, background, border, position, pointy, crop_margin, display, callback) {
    crop_margin = 0; // this was not a good idea after all

    var annHeight, annWidth;
    var id = 'robot-' + Math.random().toString().substring(2);
    var $annotation = jQuery('<div></div>');
    var $pointer = jQuery('<div></div>');
    var $target = jQuery(selector);
    if ($target.length === 0) {
        return callback(false);
    }
    var offset = $target.offset();
    var outerWidth = $target.outerWidth();
    var outerHeight = $target.outerHeight();
    var maxLeft = jQuery('html').width() - outerWidth - crop_margin;
    $annotation.attr('id', id);
    $annotation.text(text);
    $annotation.css({
        'display': display,
        'position': 'absolute',
        'font-family': 'serif',
        'box-shadow': '0 0 5px #888',
        'box-sizing': 'border-box',
        'padding': '0.75ex 0.5em 0.5ex 0.5em',
        'border': border,
        'border-radius': '2px',
        'background': background,
        'color': color,
        'z-index': '9999',
        'width': width ? width + 'px' : 'auto',
        'top': Math.max(
            (offset.top + outerHeight / 2),
            crop_margin
        ).toString() + 'px',
        'left': Math.max(crop_margin, Math.min(
            (offset.left + outerWidth / 2 - (outerWidth / 2)),
            maxLeft
        )).toString() + 'px'
    });
    $pointer.css({
        'position': 'absolute',
        'display': 'block',
        'width': 0,
        'height': 0,
        'border': '10px solid transparent',
        'bottom': 0,
        'filter': 'drop-shadow(0 0 5px #888)'
    });
    if (position === 'top') {
        $annotation.css({
            'top': 'auto',
            'bottom': (
                window.innerHeight - offset.top + crop_margin
            ).toString() + 'px'
        });
        $pointer.css({
            'bottom': 0,
            'left': '50%',
            'border-top-color': background,
            'border-bottom': 0,
            'border-top-width': '15px',
            'margin-left': '-10px',
            'margin-bottom': '-15px'
        });
    } else if (position === 'bottom') {
        $annotation.css({
            'top': (
                offset.top + outerHeight + crop_margin
            ).toString() + 'px'
        });
        $pointer.css({
            'top': 0,
            'left': '50%',
            'border-bottom-color': background,
            'border-top': 0,
            'border-bottom-width': '15px',
            'margin-left': '-10px',
            'margin-top': '-15px'
        });
    } else if (position === 'left') {
        $annotation.css({
            'left': (
                offset.left - outerWidth - crop_margin / 2
            ).toString() + 'px'
        });
        $pointer.css({
            'top': '50%',
            'right': 0,
            'border-left-color': background,
            'border-right': 0,
            'border-left-width': '15px',
            'margin-top': '-10px',
            'margin-right': '-15px'
        });
    } else if (position === 'right') {
        $annotation.css({
            'left': (Math.min(
                offset.left + outerWidth + crop_margin / 2,
                maxLeft
            )).toString() + 'px'
        });
        $pointer.css({
            'top': '50%',
            'left': 0,
            'border-right-color': background,
            'border-left': 0,
            'border-right-width': '15px',
            'margin-top': '-10px',
            'margin-left': '-15px'
        });
    } else {
        pointy = false;
    }
    if (pointy) {
        $annotation.clone().css({
            'top': 0,
            'right': 0,
            'bottom': 0,
            'left': 0,
            'box-shadow': 'none',
            'font-family': 'inherit'
        }).appendTo($annotation);
        $pointer.prependTo($annotation);
    }
    jQuery('body').append($annotation);
    if (position === 'left' || position === 'right') {
        annHeight = $annotation.outerHeight();
        $annotation.css({
            'top': Math.max((
                offset.top + outerHeight / 2 - annHeight / 2
            ), crop_margin).toString() + 'px'
        });
    } else if (position === 'top' || position === 'bottom') {
        annWidth = $annotation.outerWidth();
        $annotation.css({
            'left': Math.max((
                offset.left + outerWidth / 2 - annWidth / 2
            ), crop_margin).toString() + 'px'
        });
    } else {
        annHeight = $annotation.outerHeight();
        annWidth = $annotation.outerWidth();
        $annotation.css({
            'top': Math.max((
                offset.top + outerHeight / 2 - annHeight / 2
            ), crop_margin).toString() + 'px',
            'left': Math.max((
                offset.left + outerWidth / 2 - annWidth / 2
            ), crop_margin).toString() + 'px'
        });
    }
    callback(id);
})(
    arguments[0],  /* selector */
    arguments[1],  /* text */
    arguments[2],  /* width*/
    arguments[3],  /* color */
    arguments[4],  /* background */
    arguments[5],  /* border */
    arguments[6],  /* position */
    arguments[7],  /* pointy */
    arguments[8],  /* crop_margin */
    arguments[9],  /* display */
    arguments[10]  /* callback */
);
