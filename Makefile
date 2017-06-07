TEMPLATES=$(shell git ls-files './*.json')

all: distclean
	for template in $(TEMPLATES) ; \
	do \
		packer build --parallel=false $$template \
		&& $(MAKE) distclean \
		|| exit 1 ; \
	done

test:
	echo ${TEMPLATES} | xargs -n1 packer validate

clean:
	rm -rf packer_cache

distclean:
	rm -rf output-*

.PHONY: clean distclean
