##create connection
bakery <- dbConnect(SQLite(), "bakery.db")

## crate cake data table
cake <- data.frame(
  cake_id = 1:6,
  cake_name = c("Red Velvet", "Cheesecake", "Carrot & Walnut",
                "Banana Chocolate Mousse", "Brownie", "tiramisu"),
  cake_ingr = c("vegetable, white vinegar, baking soda",
                "Graham Cracker Crumbs, Cream Cheese, Vanilla",
                "Carrots, pecans, Cream cheese frosting",
                "Banana, Chocolate, Lemon juice ",
                "cocoa, butter, flour",
                "mascarpone, cocoa, coffee"),
  cake_price = c(20, 24, 20, 26, 22, 21)
)

## crate drink data table
drink <- data.frame(
  drink_id = 1:6,
  drink_name = c("Milk Green Tea", "Thai Tea", "Cocoa",
                 "Lemon Tea", "latte", "peach tea"),
  drink_ingr = c("matcha powder, milk, condensed milk",
                 "cinnamon, black tea bag, vanilla bean",
                 "cocoa powder, milk, heavy cream",
                 "lemon, fresh lime, sugar",
                 "coffe, milk, milk foam",
                 "black tea, lemon juice, sugar"),
  drink_price = c(12, 15, 13, 14, 15, 16)
)

## crate staff data table
staff <- data.frame(
  staff_id = 1:5, 
  sfaff_fname = c("jake", "nikita", "timofey", "emirhan",
                  "domadoj"),
  staff_lname = c("howlett", "sirmitev", "khoromovr",
                  "kat", "fancev"),
  staff_position = c("maneger", "chef", "staff", "staff",
                     "cashier"),
  staff_salary = c(35000, 25000, 15000, 15000, 15000)
)

## crate order data table
orders <- data.frame(
  order_id = 1:7,
  cake_id = c(3, 4, 5, 1, 2, 3 ,6),
  drink_id = c(1, 4, 6, 3, 2, 5, 3),
  staff_id = c(3, 4, 4, 3 ,4, 3, 3),
  order_pay = c("cash", "cash", "card", "cash", 
                "card", "cash", "card"),
  order_date = c(date("2024-07-02") , date("2024-07-02"), 
                 date("2024-07-02"), date("2024-07-02"),
                 date("2024-07-03"), date("2024-07-03"), 
                 date("2024-07-03")),
  order_time = c("11:00:00", "11:15:00", "11:45:00", "12:20:00",
                 "13:00:00", "14:45:00", "15:00:00")
)

## write table into a database
dbWriteTable(bakery, "cake", cake)
dbWriteTable(bakery, "drink", drink)
dbWriteTable(bakery, "staff", staff)
dbWriteTable(bakery, "orders", orders)

## get data from a table
cake_data <- dbGetQuery(bakery, "
  SELECT
    cake_id,
    cake_name,
    cake_price
  FROM cake
")

drink_data <- dbGetQuery(bakery, "
  SELECT
    drink_id,
    drink_name,
    drink_price
  FROM drink
")

## check table
dbListTables(bakery)

## check column in tables
dbListFields(bakery, "staff")

## disconnect file
dbDisconnect(bakary)
