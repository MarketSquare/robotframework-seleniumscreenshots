(function (selector, callback) {
    var $el = jQuery(selector);
    if ($el.length > 0) {
        $el.remove();
        callback(true);
    } else {
        callback(false);
    }
})(
    arguments[0], /* selector */
    arguments[1]  /* callback */
);
