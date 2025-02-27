
library(libresense)

#### sesion 4 ########

run_panel(
  products_file = "sesion4/vinos_4.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion4/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion4/sesion4.csv",
  dest_url="192.168.1.101:4001")

run_panel(
  products_file = "sesion4/vinos_4.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion4/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion4/sesion4.csv")



run_board(answers_dir = "sesion4/responses/")

