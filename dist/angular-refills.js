/**
 * angular-refills - AngularJS directives for Bourbon.io Refills
 * @version v0.0.2 - Sat, 28 Nov 2015 13:07:01 GMT
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

angularRefills.directive('accordionTabsMinimal', function() {
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

angularRefills.directive('centeredNavigation', function() {
  return {
    restrict: 'EAC',
    link: function(scope, element) {
      var $element, menu, mobileMenu;
      $element = $(element);
      menu = $element.find('.centered-navigation-menu').removeClass("show");
      mobileMenu = $element.find('.centered-navigation-mobile-menu').unbind();
      return mobileMenu.on('click', function(event) {
        event.preventDefault();
        return menu.slideToggle(function() {
          if (menu.is(':hidden')) {
            return menu.removeAttr('style');
          }
        });
      });
    }
  };
});
