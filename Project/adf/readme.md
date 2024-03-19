Linked service => connects adf to that service
2. use linked service to create a dataset = reprentation of that data via linked service
3. while adding dataset => opne dataset / advanced => create parameter 

# Parameter and Dynamic Query 

1. You create a `Parameter` = Empty Box
2. in directory field => you add parameter => @parameter.name
3. then in the source you provide dynamic query => `@concat(formatDateTime(utcnow(), 'yyyy'), '/', formatDateTime(utcnow(), 'MM'), '/', formatDateTime(utcnow(), 'dd'))`
4. for making it kike = landing/2024/03/19 = `@concat('landing', '/', formatDateTime(utcnow(), 'yyyy'), '/', formatDateTime(utcnow(), 'MM'), '/', formatDateTime(utcnow(), 'dd'))`
