
library(libresense)

#### sesion 9 ########

run_panel(
  products_file = "sesion9/vinos_9.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion9/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion9/sesion9.csv",
  dest_url="192.168.1.100:4001")

run_panel(
  products_file = "sesion9/vinos_9.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion9/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion9/sesion9.csv")



run_board(answers_dir = "sesion9/responses/")

