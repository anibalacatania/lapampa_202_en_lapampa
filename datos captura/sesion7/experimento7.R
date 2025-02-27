
library(libresense)

#### sesion 7 ########

run_panel(
  products_file = "sesion7/vinos_7.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion7/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion7/sesion7.csv",
  dest_url="192.168.1.100:4001")


run_panel(
  products_file = "sesion7/vinos_7.csv",
  attributes_file = "atributos.csv",
  answers_dir = "sesion7/responses/",  
  product_name = "CodigoProducto",
  design_file = "sesion7/sesion7.csv")

run_board(answers_dir = "sesion7/responses/")

