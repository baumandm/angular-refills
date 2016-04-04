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
                .removeClass('show')

            mobileMenu = $element.find('.centered-navigation-mobile-menu')
                .unbind()

            mobileMenu.on 'click', (event) ->
                event.preventDefault()
                menu.slideToggle ->
                    menu.removeAttr 'style' if menu.is ':hidden'
    }

angularRefills.directive 'expander', ->
    {
        restrict: 'EAC'
        link: (scope, element) ->
            $element = $(element)
            expanderTrigger = $element.find('.expander-trigger')

            expanderTrigger.on 'click', (event) ->
                $(this).toggleClass 'expander-hidden'
    }

angularRefills.directive 'verticalTabsContainer', ->
    {
        restrict: 'EAC'
        link: (scope, element) ->
            $element = $(element)

            verticalTab = $element.find('.js-vertical-tab')
            verticalTabAccordionHeading = $element.find('.js-vertical-tab-accordion-heading')
            verticalTabContent = $element.find('.js-vertical-tab-content')

            verticalTabContent
                .hide()
                .first()
                .show()

            # If in tab mode
            verticalTab.on 'click', (event) ->
                event.preventDefault()

                verticalTabContent.hide()
                activeTab = $(this).attr('rel')
                $('#' + activeTab).show()

                verticalTab.removeClass('is-active')
                $(this).addClass('is-active')

                verticalTabAccordionHeading.removeClass('is-active')
                $('.js-vertical-tab-accordion-heading[rel^="' + activeTab + '"]').addClass('is-active')


            # If in accordion mode
            verticalTabAccordionHeading.on 'click', (event) ->
                event.preventDefault()

                verticalTabContent.hide()
                accordion_activeTab = $(this).attr('rel')
                $('#' + accordion_activeTab).show()

                verticalTabAccordionHeading.removeClass('is-active')
                $(this).addClass('is-active')

                verticalTab.removeClass('is-active')
                $('.js-vertical-tab[rel^="' + accordion_activeTab + '"]').addClass('is-active')
    }
