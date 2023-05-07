state("Bamse")
{
	uint scene : 0x0062EC34;
	bool load : 0x0062EC70, 0x38;
	bool load1 : 0x0062EC70, 0x8, 0x38;
}

start
{
	return old.scene != 108 && current.scene == 108;
}

split
{
	return old.scene != 35 && current.scene == 35;
}

isLoading
{
	return current.load;
}