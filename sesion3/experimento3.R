
library(libresense)

#### sesion 3 ########

run_panel(
  products_file = "sesion3/vinos_3.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion3/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion3/sesion3.csv",
  dest_url="192.168.1.123:4001")

run_panel(
  products_file = "sesion3/vinos_3.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion3/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion3/sesion3.csv")


run_board(answers_dir = "sesion3/responses/")

