/**
 * angular-refills - AngularJS directives for Bourbon.io Refills
 * @version v0.0.2 - Mon, 04 Apr 2016 10:11:13 GMT
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
      menu = $element.find('.centered-navigation-menu').removeClass('show');
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

angularRefills.directive('expander', function() {
  return {
    restrict: 'EAC',
    link: function(scope, element) {
      var $element, expanderTrigger;
      $element = $(element);
      expanderTrigger = $element.find('.expander-trigger');
      return expanderTrigger.on('click', function(event) {
        return $(this).toggleClass('expander-hidden');
      });
    }
  };
});

angularRefills.directive('verticalTabsContainer', function() {
  return {
    restrict: 'EAC',
    link: function(scope, element) {
      var $element, verticalTab, verticalTabAccordionHeading, verticalTabContent;
      $element = $(element);
      verticalTab = $element.find('.js-vertical-tab');
      verticalTabAccordionHeading = $element.find('.js-vertical-tab-accordion-heading');
      verticalTabContent = $element.find('.js-vertical-tab-content');
      verticalTabContent.hide().first().show();
      verticalTab.on('click', function(event) {
        var activeTab;
        event.preventDefault();
        verticalTabContent.hide();
        activeTab = $(this).attr('rel');
        $('#' + activeTab).show();
        verticalTab.removeClass('is-active');
        $(this).addClass('is-active');
        verticalTabAccordionHeading.removeClass('is-active');
        return $('.js-vertical-tab-accordion-heading[rel^="' + activeTab + '"]').addClass('is-active');
      });
      return verticalTabAccordionHeading.on('click', function(event) {
        var accordion_activeTab;
        event.preventDefault();
        verticalTabContent.hide();
        accordion_activeTab = $(this).attr('rel');
        $('#' + accordion_activeTab).show();
        verticalTabAccordionHeading.removeClass('is-active');
        $(this).addClass('is-active');
        verticalTab.removeClass('is-active');
        return $('.js-vertical-tab[rel^="' + accordion_activeTab + '"]').addClass('is-active');
      });
    }
  };
});
