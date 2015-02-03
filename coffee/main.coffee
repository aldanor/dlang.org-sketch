intializeTwitterWidget = ->
    CustomizeTwitterWidget {url: 'css/twitter.css'}

initializeDocPopups = ->
    # $.fn.popup.defaults.type          = 'tooltip'
    # $.fn.popup.defaults.vertical      = 'bottom'
    # $.fn.popup.defaults.horizontal    = 'leftedge'
    # $.fn.popup.defaults.offsetleft    = -45
    # $.fn.popup.defaults.transition    = '0.3s opacity 0.0s'
    $.fn.popup.defaults.tooltipanchor = $('#ForeachType_open')

    $('.doc-crossref').each ->
        el = $(this)
        target = $(el.data 'target')
        if target?
            target.click ->
                target.popup 'hide'
            el.click (event) ->
                if target.data 'popup-visible'
                    target.popup 'hide'
                else
                    target.popup
                        tooltipanchor: event.target
                        autoopen: true
                        transition: 'all 0.3s'
                        scrolllock: true
                event.stopPropagation()

initializeDocCollapse = ->
    $('.doc-declaration').each ->
        el = $(this)
        target = el.find(el.data('target'))
        icon = el.find('i.doc-collapse')
        if icon? and target?
            el.click ->
                if target.hasClass('collapse in')
                    icon.removeClass 'fa-angle-double-up'
                    icon.addClass 'fa-angle-double-down'
                else
                    icon.removeClass 'fa-angle-double-down'
                    icon.addClass 'fa-angle-double-up'


$ ->
    initializeDocPopups()
    initializeDocCollapse()
    intializeTwitterWidget()


# $ ->
#     $('#github-commits').githubInfoWidget
#         user: 'D-Programming-Language'
#         repo: 'dmd'
#         branch: 'master'
