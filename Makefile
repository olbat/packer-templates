TEMPLATES=$(shell git ls-files './*.json')

all: distclean
	echo ${TEMPLATES} | xargs packer build --parallel=false

test:
	echo ${TEMPLATES} | xargs packer validate

clean:
	rm -rf packer_cache

distclean:
	rm -rf output-*

.PHONY: clean distclean
