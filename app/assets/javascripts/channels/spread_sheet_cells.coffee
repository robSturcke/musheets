App.spread_sheet_cells = App.cable.subscriptions.create "SpreadsheetCellsChannel",
  received: (data) ->
    App.spreadsheet.update_cell(data.new_val)

  set_cell_value: (location, value) ->
    location = [location['r'], location['c']]
    @perform('set_cell_value', location: location, value: value)
