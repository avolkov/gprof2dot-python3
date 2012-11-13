install:
	make clean
	python setup.py install
clean:
	rm -rf build  dist gprof2dot.egg-info
runtests:
	cd gprof2dot/tests/ && make runall
runbasic:
	cd gprof2dot/tests/ && make basic
cleantests:
	cd gprof2dot/tests/
	ls
