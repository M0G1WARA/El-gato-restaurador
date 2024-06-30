extends Node

var backpacks: Array[Dictionary] = [
	{"price":100, "name" : "Cinturon con bolsa", "description": "Te permite llevar 1 objeto adicional", "layer":10, "uses":0},
	{"price":250, "name" : "Mochila grande", "description": "Te permite llevar 3 objetos adicionales", "layer":10,"uses":0},
]

var items: Array[Dictionary]= [
	{"price":120, "name" : "Disolvente y brocha", "description": "Te permite limpiar la pintura de las paredes", "layer":0, "uses":5},
	{"price":80, "name" : "Linterna", "description": "Te permite ver en las noches", "layer":1,"uses":5},
]

var products: Array[Dictionary]= backpacks + items

var backpack: Array[int] = [2]

var item_selected: int = -1
