extends Node

var money = 0
var IntensityLevel = 1
var weight = 2.0

var backpacks: Array[Dictionary] = [
	{"price":100, "name" : "Cinturon con bolsa", "description": "Te permite llevar 1 objeto adicional, pero velocidad al escalada se disminuirá un poco.", "layer":-1, "uses":0},
	{"price":250, "name" : "Mochila grande", "description": "Te permite llevar 3 objetos adicionales, pero disminuirá tu velocidad al escalar", "layer":-1,"uses":0},
]

var items: Array[Dictionary]= [
	{"price":60, "name" : "Disolvente y brocha", "description": "Te permite limpiar la pintura de las paredes", "layer":0, "uses":3},
	{"price":100, "name" : "Linterna", "description": "Te permite ver en las noches", "layer":-1,"uses":5},
	{"price":140, "name" : "Tienda de campaña", "description": "Te permite dormir por las noches", "layer":-1,"uses":8},
	{"price":80, "name" : "Resanador de grietas", "description": "Te permite restaurar las grietas de la priedra", "layer":1,"uses":2},
	{"price":150, "name" : "Pintura en aerosol", "description": "Algunas personas lo usan para dañar las pinturas rupestres", "layer":2,"uses":5},
]

var products: Array[Dictionary]= backpacks + items

var backpack: Array[int] = [2]

var item_selected: int = -1


var tmp_days: int = 0
var tmp_hours: int = 0

var record_score: int = 0
var record_days: int = 0
var record_hours: int = 0

var wanted = false
