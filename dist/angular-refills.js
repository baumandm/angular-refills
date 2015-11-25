/**
 * angular-refills - AngularJS directives for Bourbon.io Refills
 * @version v0.0.1 - Wed, 25 Nov 2015 22:52:38 GMT
 * @link https://github.com/baumandm/angular-refills
 * @author Dave Bauman <baumandm@gmail.com>
 * @license MIT
 */
var angularRefills;

angularRefills = angular.module('angular-refills', []);

angularRefills.directive('accordionTabs', function() {
  return {
    restrict: 'EAC',
    link: function(scope, element) {
      var $element, firstTab;
      $element = $(element);
      firstTab = $element.children('li').first();
      firstTab.children('a').addClass('is-active').next().addClass('is-open').show();
      return $element.on('click', 'li > a.tab-link', function(event) {
        event.preventDefault();
        if (!$(this).hasClass('is-active')) {
          $element.find('.is-open').removeClass('is-open').hide();
          $(this).next().toggleClass('is-open').toggle();
          $element.find('.is-active').removeClass('is-active');
          return $(this).addClass('is-active');
        }
      });
    }
  };
});
