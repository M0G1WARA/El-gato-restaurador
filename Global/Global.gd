extends Node

var products: Array[Dictionary]= [
	{"price":120, "name" : "Mochila mediana", "description": "Te permite llevar 3 objeetos", "layer":10},
	{"price":50, "name" : "brocha", "description": "Te permite limpiar la pintura de las paredes", "layer":0},
]

var backpack: Array[int] = [1]

var item_selected: int = -1
