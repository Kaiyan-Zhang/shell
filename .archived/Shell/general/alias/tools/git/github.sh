github(){
	mkdir $1
	cd $1
	git init -b main
	gh repo create $1  --confirm --private
	touch README.md
	git add . && git commit -m "initial commit"
	git push --set-upstream origin main
}
