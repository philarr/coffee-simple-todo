# coffee-simple-todo
Trying out coffeescript, made a simple todo list



```coffee
new TodoList(
   # init with existing collection
   [   
      {
         id: Math.random().toString()
         value: 'Buy milk'
      },
      {
         id: Math.random().toString()
         value: 'Feed dog'
      },      
   ],
   'todo-list', # id of element to display todos
   'todo-value', # id of textbox for input
   'todo-submit' # id of button for submit
   );
 
