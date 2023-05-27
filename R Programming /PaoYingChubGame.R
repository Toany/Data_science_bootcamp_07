# Pao Ying Chub
Pao_Ying_Chub_Game <- function() {
  Player_Score <- 0
  Bot_Score <- 0
  Tied_time <- 0
  numberGame <- 0
  options <- c("scissors", "paper", "rock")
  
  print("Let's Play scissors-paper-rock")
  print("Let's Choose")
  print("1. Scissors")
  print("Press 1")
  print("2. Paper")
  print("Press 2")
  print("3. Rock")
  print("Press 3")
  print("If you want to exit please type : EXIT")
  
  while(TRUE) {
    random <- sample(options, 1)
    player_choose <- readline("Your answers : ")
    convert <- as.character(player_choose)
    if (convert == "1" & random == "paper" |
        convert == "2" & random == "rock" |
        convert == "3" & random == "scissors") {
      print("You won")
      Player_Score <- Player_Score + 1
      numberGame <- numberGame + 1
    } else if (convert == "1" & random == "rock" |
              convert == "2" & random == "scissors" |
              convert == "3" & random == "paper") {
      print("I won")
      Bot_Score <- Bot_Score + 1
      numberGame <- numberGame + 1
    } else if (convert == "1" & random == "scissors" |
               convert == "2" & random == "paper" |
               convert == "3" & random == "rock") {
      print("Owww Tied")
      Tied_time <- Tied_time + 1
      numberGame <- numberGame + 1
    } else if (convert == "EXIT" | convert == "exit") {
      print("Thanks For Playing our lonely chat bot game LOL")
      print(paste("Player Score : ", Player_Score))
      print(paste("Bot Score : ", Bot_Score))
      print(paste("Tied Time : ", Tied_time))
      print(paste("Number Game Played : ", numberGame))
      break
    } else {
      print("What are you doing ???")
    }
  }
}
