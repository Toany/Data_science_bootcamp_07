# Chat bot with 5 dialog -บอทช่วยจด menu อาหาร + คำนวณ ยอด bill
Chatbot_menu <- function() {
  total_bill <- 0
  
  print("Hello! Please choose menu")
  print("1. KFC - 10$")
  print("Press 1")
  print("2. Pizza - 15$")
  print("Press 2")
  print("3. Hamberger - 8$")
  print("Press 3")
  print("If you want to exit please type : EXIT")
  
  while(TRUE){
    choose <- readline("Your menu : ")
    convert <- as.character(choose)
    if (convert == "1") {
      print("KFC!")
      total_bill <- total_bill + 10
      print(paste("Your Total :", total_bill, "$"))
    } else if (convert == "2") {
      print("Pizza!")
      total_bill <- total_bill + 15
      print(paste("Your Total :", total_bill, "$"))
    } else if (convert == "3") {
      print("Hamberger!")
      total_bill <- total_bill + 8
      print(paste("Your Total :", total_bill, "$"))
    } else if (convert == "EXIT" | convert == "exit") {
      print(paste("Your Total :", total_bill, "$"))
      break
    } else {
      print("ERROR")
    }
  }
  
}
