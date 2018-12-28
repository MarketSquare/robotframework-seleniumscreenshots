(function (callback) {
    var w = window, d = document, e = d.documentElement,
        g = d.getElementsByTagName('body')[0], x = 0, y = 0,
        width = w.innerWidth || e.clientWidth || g.clientWidth,
        height = w.innerHeight || e.clientHeight || g.clientHeight;
    if (typeof pageYOffset != 'undefined') {
        y = pageYOffset;
    } else {
        if (e.clientHeight) {
            y = e.scrollTop; /* IE 'stdsmode' */
        } else {
            y = d.body.scrollTop; /* IE 'quirksmode' */
        }
    }
    callback([x, y, width, height]);
})(
    arguments[0]  /* callback */
);
