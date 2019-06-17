App.notification = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    debugger
    $('#notificationList').prepend "#{data.notification}"
    this.update_counter(data.counter)
    update_counter: (counter) -> $('#notification-counter').html "#{counter}"
