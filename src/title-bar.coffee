module.exports =
class TitleBar
  constructor: ({@workspace, @themes, @applicationDelegate}) ->
    @element = document.createElement('div')
    @element.classList.add('title-bar')

    @titleElement = document.createElement('div')
    @titleElement.classList.add('title')
    @element.appendChild(@titleElement)

    @workspace.onDidChangeActivePaneItem => @updateTitle()
    @themes.onDidChangeActiveThemes => @updateWindowSheetOffset()

    @updateTitle()
    @updateWindowSheetOffset()

  updateTitle: ->
    @titleElement.textContent = document.title

  updateWindowSheetOffset: ->
    @applicationDelegate.getCurrentWindow().setSheetOffset(@element.offsetHeight)
