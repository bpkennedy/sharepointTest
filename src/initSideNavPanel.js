/**
 * Directive:
 * initSideNavPanel (init-side-nav-panel)
 *
 * Description:
 * Ran into a problem with the side nav panel toggle button not being found on initial $digest cycle (when initializing
 * the side nav panel jquery within a <script> on the page), so this was the quick workaround.
 * Ideally, the entire side nav panel would be rewritten to be Angular-only.
 *
 * Usage (in nav html):
 * <div id="snp-toggle" init-side-nav-panel full-name="{{user.fullName}}"></div>
 */

(function (angular, $) {
    'use strict';

    var module = angular.module('common.initSideNavPanel', []);

    module.directive('initSideNavPanel', ['$timeout', function () {
        return {
            link: function (scope, element, attrs) {

                var $wrapper = $("#wrapper"),
                    $toggle = $(element);

                window.sideNavPanel.createSideNavPanel($wrapper, $toggle);
            },
            scope: {
                fullName: '@fullName'
            },
            // sets visibitity to hidden if user has no pic (to hide browser's broken img icon)
            template: '<div class="user-img"></div><div class="user-name">{{fullName}}</div>'
        };
    }]);

}(window.angular, window.jQuery));
