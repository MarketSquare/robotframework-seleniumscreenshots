(function (selectors, crop_margin, callback) {
    var i, $target, offset, left = null, top = null, width = null,
        height = null;
    for (i = 0; i < selectors.length; i++) {
        $target = jQuery(selectors[i]);
        if ($target.length === 0) {
            return callback([selectors[i]]);
        }
        offset = $target.offset();
        if (left === null || width === null) {
            width = $target.outerWidth();
        } else {
            width = Math.max(
                left + width, offset.left + $target.outerWidth()
            ) - Math.min(left, offset.left);
        }
        if (top === null || height === null) {
            height = $target.outerHeight();
        } else {
            height = Math.max(
                top + height, offset.top + $target.outerHeight()
            ) - Math.min(top, offset.top);
        }
        if (left === null) {
            left = offset.left;
        } else {
            left = Math.min(left, offset.left);
        }
        if (top === null) {
            top = offset.top;
        } else {
            top = Math.min(top, offset.top);
        }
    }
    callback([Math.max(0, left - crop_margin),
        Math.max(0, top - crop_margin),
        Math.min(window.outerWidth, width + crop_margin * 2),
        height + crop_margin * 2]);
})(
    arguments[0], /* selectors */
    arguments[1], /* crop_margin */
    arguments[2]  /* callback */
);
