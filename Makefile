publish:
	minori d
	minori c
	git add .
	git commit -m "update at `date`"
	git push