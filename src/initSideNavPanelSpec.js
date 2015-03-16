(function (angular, $) {
    "use strict";

    describe('initSideNavPanel directive', function () {

        var scope,
            $sandbox,
            $compile,
            templates,
            elm;

        beforeEach(module('common.initSideNavPanel'));

        beforeEach(inject(function ($rootScope, _$compile_) {
            scope = $rootScope;
            $compile = _$compile_;
            $sandbox = $('<div id="sandbox"></div>').appendTo($('body'));
            spyOn(window.sideNavPanel, 'createSideNavPanel');
        }));

        afterEach(function () {
            $sandbox.remove();
            scope.$destroy();
        });

        templates = {
            'default': '<div id="wrapper"><i class="icon-user" id="common-snp-toggle" init-side-nav-panel></i></div>'
        };

        function compileDirective(template) {
            template = template ? templates[template] : templates['default'];
            template = $(template).appendTo($sandbox);
            var elm = $compile(template)(scope);
            scope.$digest();
            return elm;
        }

        it("should initialize the side nav panel", function () {
            elm = compileDirective();
            expect(window.sideNavPanel.createSideNavPanel).toHaveBeenCalled();
        });
    });

}(window.angular, window.jQuery));