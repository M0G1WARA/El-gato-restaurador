extends Node

var products: Array[Dictionary]= [
	{"price":50, "name" : "brocha", "description": "Te permite limpiar la pintura de las paredes", "layer":0},
	{"price":120, "name" : "Mochila mediana", "description": "Te permite llevar 3 objeetos", "layer":-1}
]

var backpack: Array[int] = []

var item_selected: int = 0
