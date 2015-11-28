angularRefills = angular.module 'angular-refills', []

angularRefills.directive 'accordionTabs', ->
    {
        restrict: 'EAC'
        link: (scope, element) ->
            $element = $(element)

            firstTab = $element.children('li').first()
            firstTab
                .children('a')
                .addClass('is-active')
                .next()
                .addClass('is-open')
                .show()

            $element.on 'click', 'li > a.tab-link', (event) ->
                event.preventDefault()
                if not $(this).hasClass 'is-active'

                    $element.find('.is-open').removeClass('is-open').hide()
                    $(this).next().toggleClass('is-open').toggle()

                    $element.find('.is-active').removeClass('is-active')
                    $(this).addClass 'is-active'
    }

angularRefills.directive 'accordionTabsMinimal', ->
    {
        restrict: 'EAC'
        link: (scope, element) ->
            $element = $(element)

            firstTab = $element.children('li').first()
            firstTab
                .children('a')
                .addClass('is-active')
                .next()
                .addClass('is-open')
                .show()

            $element.on 'click', 'li > a.tab-link', (event) ->
                event.preventDefault()
                if not $(this).hasClass 'is-active'
                
                    $element.find('.is-open').removeClass('is-open').hide()
                    $(this).next().toggleClass('is-open').toggle()

                    $element.find('.is-active').removeClass('is-active')
                    $(this).addClass 'is-active'
    }

angularRefills.directive 'centeredNavigation', ->
    {
        restrict: 'EAC'
        link: (scope, element) ->
            $element = $(element)

            menu = $element.find('.centered-navigation-menu')
                .removeClass("show")

            mobileMenu = $element.find('.centered-navigation-mobile-menu')
                .unbind()

            mobileMenu.on 'click', (event) ->
                event.preventDefault()
                menu.slideToggle ->
                    menu.removeAttr 'style' if menu.is ':hidden'
    }
