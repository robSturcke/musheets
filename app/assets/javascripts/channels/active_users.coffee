App.active_users = App.cable.subscriptions.create "ActiveUsersChannel",
  received: (data) ->
    if data.old_val && !data.new_val
      App.spreadsheet.remove_user(data.old_val)
    else if data.new_val
      App.spreadsheet.new_user(data.new_val)
    else if data.current_user
      App.spreadsheet.set_current_user(data.current_user)
    else if data.locked_cell
      App.spreadsheet.acquired_cell_lock(data.locked_cell)

  select_cells: (cells) ->
    @perform('select_cells', selected_cells: cells)

  locked_cell: (location) ->
    @perform('locked_cell', location: location)

  unlock_cell: (location) ->
    @perform('unlock_cell', location: location)
