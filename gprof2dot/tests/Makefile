run:
	./runtests.sh
clean:
	./clean.sh
basic:
	./base_test.sh
unittests: test_*.py
	echo $<
	python $<

all: clean basic run unittests
