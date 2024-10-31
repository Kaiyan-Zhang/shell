if [ $ISMAC -eq 1 ]; then
	install "rg"
else
	install "ripgrep"
	alias rg="ripgrep"
fi