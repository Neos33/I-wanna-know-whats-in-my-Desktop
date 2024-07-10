/// @description Destroy Time Sources
if time_source_exists(ts)
{
	time_source_destroy(ts);
	print("room restarted, destroy time source");
}