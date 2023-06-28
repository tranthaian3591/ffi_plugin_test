default: clean gen_apple
clean_and_build: clean build
build: default lipo

gen_apple:
    melos build:apple

clean:
    melos clean
    cd packages/vysma_design/native && cargo clean
