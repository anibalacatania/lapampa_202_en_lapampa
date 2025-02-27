
library(libresense)

#### sesion 2########

run_panel(
  products_file = "sesion1/vinos_1.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion1/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion1/sesion1.csv",
  dest_url="192.168.1.100:4001")

run_panel(
  products_file = "sesion1/vinos_1.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion1/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion1/sesion1.csv")



run_board(answers_dir = "sesion1/responses/")

