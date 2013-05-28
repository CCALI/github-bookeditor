define [
  'jquery'
  'underscore'
  'backbone'
  'marionette'
  'cs!views/workspace/menu/auth'
  'cs!views/workspace/menu/add'
  'cs!views/workspace/menu/toolbar-search'
  'hbs!templates/layouts/workspace/menu'
], ($, _, Backbone, Marionette, AuthView, AddView, ToolbarView, menuTemplate) ->
  
  _toolbar = null

  return new (Marionette.Layout.extend
    template: menuTemplate

    regions:
      add: '#workspace-menu-add'
      auth: '#workspace-menu-auth'
      toolbar: '#workspace-menu-toolbar'

    onRender: () ->
      @load(_toolbar)

    load: (view) ->
      _toolbar = view or new ToolbarView()

      @add.show(new AddView())
      @auth.show(new AuthView())
      @toolbar.show(_toolbar)

    showToolbar: (view) ->
      @load(view or new ToolbarView())
  )()
