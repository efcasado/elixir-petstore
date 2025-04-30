.PHONY: all generate compile check docs shell clean purge

SHELL := BASH_ENV=.rc /bin/bash --noprofile

OAS_FILE ?= https://petstore3.swagger.io/api/v3/openapi.json
GENERATOR_OPTS ?= --skip-validate-spec --additional-properties=packageName=elixir-petstore --additional-properties=invokerPackage=PetStore

all: generate compile check docs

generate:
	openapi-generator-cli generate -i $(OAS_FILE) -g elixir -o local/out/elixir $(GENERATOR_OPTS)

	mv local/out/elixir/* .
	rm -rf local

compile: deps
	mix compile

deps:
	mix deps.get

check:
	mix dialyzer --format dialyxir

docs:
	mix docs

shell:
	iex -S mix

clean:
	-mix clean --all
	-mix deps.clean --all

purge:
	rm -rf lib/*
	rm -f .openapi-generator-ignore
	rm -rf _build/
	rm -rf doc/
	rm -rf elixir/
	rm -rf config/
	rm -rf packages/
	rm -rf local/
	rm -rf archives/
	rm -rf test/
	rm -f mix.exs
	rm -f mix.lock
	rm -f cache.ets
	rm -rf deps
	rm -rf lib



