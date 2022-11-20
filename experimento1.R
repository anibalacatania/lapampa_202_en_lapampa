
library(libresense)

#### 4 copas rep 1 ########

run_panel(
  products_file = "vinos_prueba.csv",
  attributes_file = "atributos.csv",
  answers_dir = "prueba/",  
  product_name = "CodigoProducto",
  dest_url="192.168.1.123:4001")

run_panel(
  products_file = "vinos_4.csv",
  attributes_file = "atributos.csv",
  answers_dir = "answers4/",  
  product_name = "CodigoProducto")


un_board(answers_dir = "answers1/")
?run_panel
