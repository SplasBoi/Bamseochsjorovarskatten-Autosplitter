state("Bamse")
{
	uint scene : 0x0062EC34;
	uint load : 0x0062EC70, 0x38;
}

start
{
	return current.scene == 108;
}

split
{
	return current.scene == 35;
}

isLoading
{
	return current.load == 1;
}
