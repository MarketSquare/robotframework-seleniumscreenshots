(function (selector, text, color, background, size, top, left, callback) {
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
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'center',
        'font-family': 'serif',
        'text-align': 'center',
        'opacity': '1',
        '-moz-box-sizing': 'border-box',
        '-webkit-box-sizing': 'border-box',
        'box-sizing': 'border-box',
        'position': 'absolute',
        'color': color,
        'background': background,
        'width': size + 'px',
        'height': size + 'px',
        'font-size': Math.floor(size / 1.5) + 'px',
        'top': (offset.top + (height * (top / 100.0))) - (size / 2) + 'px',
        'left': (offset.left + (width * (left / 100.0))) - (size / 2) + 'px',
        'border-radius': (size / 2).toString() + 'px',
        'box-shadow': '0 0 5px #888',
        'z-index': '9999'
    });
    $annotation.text(text);
    jQuery('body').append($annotation);
    callback(id);
})(
    arguments[0], /* selector */
    arguments[1], /* text */
    arguments[2], /* color */
    arguments[3], /* background */
    arguments[4], /* size */
    arguments[5], /* top */
    arguments[6], /* left */
    arguments[7]  /* callback */
);
