## crate hand data 
hand <- c("hammer", "scissor", "paper")

## crate pao ying chub function
pao_ying_chub <- function(){
  print("pao ying chub game")
  user_name <- readline("your name : ")
  print(paste0("Hi!", user_name, " Welcome to pao ying chub game"))
  print("Ready!")

## count point 
  player_point <- 0
  bot_point <- 0

## start game 10 round   
  game <- 0
  while (game < 10){
    player <- readline("your turn : ")
    bot <- sample(hand, size=1)
      print(paste0("bot :", bot))

## condition about this game  
    if(player == "hammer" & bot == "scissor" |
       player == "scissor" & bot == "paper" |
       player == "paper" & bot == "hammer"){
      print("win")

## count player point if him win      
      player_point <- player_point +1
    }


    else if(player == "hammer" & bot == "paper" |
            player == "scissor" & bot == "hammer" |
            player == "paper" & bot == "scissor"){
      print("lose")

## count bot point if it win        
      bot_point <- bot_point +1

    } else {
      print("draw")
    }
      game <- game + 1
  }

## count point and end game
  print(paste0("your point ", player_point, " point."))
  print(paste0("bot point ", bot_point, " point."))
  if(player_point > bot_point){
    print(paste0("congreatuation!! ", user_name, " you are the winner."))
  } else if (player_point < bot_point){
    print("you lose, try again.")
    } else {
      print("draw")
    }
} 
