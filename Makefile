CPPFLAGS=-std=c++11 -I./include -Wall -Werror -g
CC=clang++

all: unittests sandbox performance sandbox_rtti

sandbox: sandbox.cpp
	${CC} sandbox.cpp -o sandbox ${CPPFLAGS}

sandbox_json: sandbox_json.cpp
	${CC} sandbox_json.cpp -o sandbox_json ${CPPFLAGS}

sandbox_rtti: sandbox_rtti.cpp
	${CC} sandbox_rtti.cpp -o sandbox_rtti ${CPPFLAGS} -O3

unittests: unittests.cpp
	${CC} unittests.cpp -o unittests -lboost_unit_test_framework ${CPPFLAGS}
	./unittests --show_progress

performance: performance.cpp
	${CC} performance.cpp -o performance -lboost_serialization ${CPPFLAGS} -O3

.PHONY: doc
doc:
	@doxygen ./doc/doxygen.cfg

clean:
	rm sandbox; rm unittests; rm performance; rm sandbox_rtti;