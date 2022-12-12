
library(libresense)

#### sesion 8 ########

run_panel(
  products_file = "sesion8/vinos_8.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion8/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion8/sesion8.csv",
  dest_url="192.168.1.123:4001")

run_panel(
  products_file = "sesion8/vinos_8.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion8/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion8/sesion8.csv")
 


run_board(answers_dir = "sesion8/responses/")

