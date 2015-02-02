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

$ ->
    initializeDocPopups()
    intializeTwitterWidget()


# $(document).ready(function() {
#   $('#example-type-inference').on('show', function() {
#     $('#example-type-inference-toggle')
#     .html('Hide example <i class="fa fa-care-up"></i>');
#   });
#   $('#example-type-inference').on('hide', function() {
#     $('#example-type-inference-toggle')
#     .html('Show example <i class="fa fa-care-down"></i>');
#   });
# });


# $ ->
#     $('#github-commits').githubInfoWidget
#         user: 'D-Programming-Language'
#         repo: 'dmd'
#         branch: 'master'
