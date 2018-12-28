(function (selector, size, top, left, callback) {
    var id = 'robot-' + Math.random().toString().substring(2);
    var $annotation = jQuery('<div></div>');
    var $target = jQuery(selector);
    if ($target.length === 0) {
        return callback(false)
    }
    var offset = $target.offset();
    var height = $target.outerHeight();
    var width = $target.outerWidth();
    $annotation.attr('id', id);
    $annotation.css({
        'display': 'block',
        'font-family': 'serif',
        'text-align': 'center',
        'opacity': '0.3',
        '-moz-box-sizing': 'border-box',
        '-webkit-box-sizing': 'border-box',
        'box-sizing': 'border-box',
        'position': 'absolute',
        'color': 'white',
        'background': 'black',
        'width': size + 'px',
        'height': size + 'px',
        'top': (offset.top + (height * (left / 100.0))) - (size / 2) + 'px',
        'left': (offset.left + (width * (top / 100.0))) - (size / 2) + 'px',
        'border-radius': (size / 2).toString() + 'px',
        'z-index': '9999'
    });
    jQuery('body').append($annotation);
    callback(id);
})(
    arguments[0], /* selector */
    arguments[1], /* size */
    arguments[2], /* top */
    arguments[3], /* left */
    arguments[4]  /* callback */
);
