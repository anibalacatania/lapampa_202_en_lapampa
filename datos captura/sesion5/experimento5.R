
library(libresense)

#### sesion 5 ########

run_panel(
  products_file = "sesion5/vinos_5.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion5/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion5/sesion5.csv",
  dest_url="192.168.1.101:4001")

run_panel(
  products_file = "sesion5/vinos_5.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion5/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion5/sesion5.csv")


run_board(answers_dir = "sesion5/responses/")

