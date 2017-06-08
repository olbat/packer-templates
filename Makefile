TEMPLATES='./*.json'

all: distclean
	git ls-files -z $(TEMPLATES) | xargs -0 -n1 -I{} sh -c \
		'packer build --parallel=false {} \
		&& $(MAKE) distclean \
		|| exit 255'

test:
	git ls-files -z $(TEMPLATES) | xargs -0 -n1 packer validate

clean:
	rm -rf packer_cache

distclean:
	rm -rf output-*

.PHONY: clean distclean
