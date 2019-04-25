if (hasweapon){
	mygun = instance_create_layer(x, y, "Weapon", oEWep)
	with (mygun){
		owner = other.id;
	}
}
else mygun = noone;