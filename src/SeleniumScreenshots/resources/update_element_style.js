(function (selector, name, value, callback) {
    var $el = jQuery(selector);
    if ($el.length > 0) {
        $el.css(name, value);
        callback(true);
    } else {
        callback(false);
    }
})(
    arguments[0], /* selector */
    arguments[1], /* name */
    arguments[2], /* value */
    arguments[3]  /* callback */
);
