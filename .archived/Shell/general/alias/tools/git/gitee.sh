gitee(){
	mkdir $1
	cd $1
	git init -b main
	touch README.md
	git add .
	git commit -m "hello"
	git remote add origin https://gitee.com/kaiyan3/$(basename $PWD).git
	git push -u origin main
}
