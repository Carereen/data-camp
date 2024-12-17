## create pizza menu data frame 
pizza_menu <- data.frame(pizza_id = 1:9,
              pizza = c("chicken&bacon", "pork BBQ", 
                        "double cheese", "hawaiian", 
                        "seafood cocktail", "shrimp cocktail",
                        "tom yum kung", "double pepperoin", 
                        "ham&crab sticks"),
              pizza_price = c(15, 16, 15, 14, 17, 
                              20, 22, 28, 30))

## create snack menu data frame
snack_menu <- data.frame(snack_id = 1:5,
              snack = c("french fires", "cheese ball",
                        "chicken nugget", "mashed potato",
                        "egg tart"),
              snack_price = c(5, 6, 7, 8, 4))

## create drink menu data frame
drink_menu <- data.frame(drink_id = 1:5,
              drink = c("lemon-lime", "orange soda", "cola",
                        "grape soda", "cream soda"),
              drink_price = c(4, 3, 5, 4, 5))

## create good bye data frame 
good_bye <- data.frame(thanks = c("Have a nice day.", 
                                  "Have a good time.", 
                                  "You can brew it.",
                                  "It's a brew-tiful day.",
                                  "Good day start with pizza and 
                                  you."))

## create pizza function | welcome to my pizzeria restaurant
pizza <- function(){
  print("Hello welcome to pizzeria restaurant!")
  print("May I have your order?")

  ## view pizza menu and order pizza 
  View(pizza_menu)
  pizza_order <- readline("pizza order (or 'no'): ")
  if(pizza_order %in% pizza_menu$pizza){
    print(paste0("Your pizza order:", pizza_order))
  } else if(pizza_order == "no"){
    print("And would you like anything to eat?")
  } else {
    print("can't found, Plase try again.")
  } 

  ## calculate pizza order price 
  price_pz <- if(pizza_order %in% pizza_menu$pizza){
    pizza_menu$pizza_price[pizza_menu$pizza == pizza_order]
  } else {
    0      
  }

  ## view snack menu and order snack   
  View(snack_menu)
  snack_order <- readline("snack order (or 'no'): ")
  if(snack_order %in% snack_menu$snack){
    print(paste0("You snack order:", snack_order))
  } else if(snack_order == "no"){
    print("And would you like anything to drink?")
  } else {
    print("can't found, Plase try again.")
  }

  ## calculate snack order price  
  price_sn <- if(snack_order %in% snack_menu$snack){
    snack_menu$snack_price[snack_menu$snack == snack_order]
  } else {
    0
  }

  ## view drink menu and order drink      
  View(drink_menu)
  drink_order <- readline("drink order (or 'no'): ")
  if(drink_order %in% drink_menu$drink){
    print(paste("You drink order:", drink_order))
  } else if(drink_order == "no"){
    print("No drink, order complete.")
  } else {
    print("can't found. Please try again.")
  }

  ## calculate snack order price   
  price_dr <- if(drink_order %in% drink_menu$drink){
    drink_menu$drink_price[drink_menu$drink == drink_order]
  } else {
    0
  }
  ## calculate total order price   
  total_price <- sum(price_pz, price_sn, price_dr) 
  print(paste0("Total price : $", total_price))
  print("Would you like to pay by cash or card?")
  order_pay <- readline("cash or card: ")

  ## say good bye
  say_good_bye <- sample_n(good_bye, size=1)
  print(say_good_bye)
}
