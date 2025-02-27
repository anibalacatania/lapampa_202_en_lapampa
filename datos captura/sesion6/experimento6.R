
library(libresense)

#### sesion 6 ########

run_panel(
  products_file = "sesion6/vinos_6.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion6/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion6/sesion6.csv",
  dest_url="192.168.1.100:4001")

run_panel(
  products_file = "sesion6/vinos_6.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion6/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion6/sesion6.csv")
 


run_board(answers_dir = "sesion6/responses/")

