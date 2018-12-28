(function (callback) {
    var inject_missing_jquery, wait_for_bootstrapped_jquery;
    inject_missing_jquery = function () {
        if (typeof window.jQuery !== 'function') {
            var script = window.document.createElement('script');
            script.src = '//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js';
            window.document.body.appendChild(script);
        }
    };
    wait_for_bootstrapped_jquery = function () {
        if (typeof window.jQuery !== 'function') {
            window.setTimeout(wait_for_bootstrapped_jquery, 1000);
        } else {
            jQuery.expr[":"].icontains = jQuery.expr.createPseudo(function (arg) {
                return function (elem) {
                    return jQuery(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
                };
            });
            callback(true);
        }
    };
    inject_missing_jquery();
    wait_for_bootstrapped_jquery();
})(
    arguments[0] /* callback */
);
