
library(libresense)

#### sesion 2 ########

run_panel(
  products_file = "sesion2/vinos_2.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion2/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion2/sesion2.csv",
  dest_url="192.168.1.102:4001")

run_panel(
  products_file = "sesion2/vinos_2.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion2/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion2/sesion2.csv")


run_board(answers_dir = "sesion2/responses/")

