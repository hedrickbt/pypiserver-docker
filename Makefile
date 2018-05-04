TAG:=homecu/pypiserver
SOURCES:= \
	Dockerfile \
	requirements.txt

ifeq ($(VERBOSE),1)
  VFILTER:=
else
  VFILTER:= >/dev/null
endif

.PHONY: build
build: $(SOURCES)
	docker build -t $(TAG) . $(VFILTER)
