class TodoList
  constructor: (@todos = [], list, textbox, button) ->
    #@todo is created by parameter
    @list = document.getElementById(list)
    @textbox = document.getElementById(textbox)
    @button = document.getElementById(button)
    @list.addEventListener('click', @remove) # method already bound by fat arrow when first declared
    @button.addEventListener('click', @add) # method already bound by fat arrow when first declared
    @update()

  update: () ->
    # we can even do it a single line, just need paranthesis to denote a collection
    # html = ("<div id='#{task.id}'>#{task.value}</div>" for task in @todos)
    html = for task in @todos
      do (task) -> "<div id='#{task.id}'> -> #{task.value}</div>"
    @list.innerHTML = html.join("")

  add: () => # tells cs to bind in constructor
    todoObj = {
      id: (Math.random()*100).toString()[0..5] #no need for comma, just use new line
      value: @textbox.value
    }
    @todos.push(todoObj)
    @textbox.value = ''
    @textbox.focus()
    @update()
    true
  
  remove: (e) => # tells cs to bind in constructor
    id = e.target.id # get id by event bubble
    toRemove = index for task, index in @todos when task.id is id # magical sql-like expression
    @todos.splice(toRemove, 1)
    @update()
    true
    
  unmount: ->
    @list.removeEventListener('click', @remove)
    @button.removeEventListener('click', @add)
    true
