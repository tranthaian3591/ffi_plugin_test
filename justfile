test_macos: build_apple
    cd packages/flutter_vysma_design/example && flutter test -d macos integration_test

build_apple:
  melos run build:apple
  cp platform-build/VysmaDesignLayout.xcframework.zip packages/flutter_vysma_design/macos/Frameworks/vysma_design-v0.0.7.zip
  # Unknown how to get current version of library
  # cp platform-build/VysmaDesignLayout.xcframework.zip packages/flutter_vysma_design/macos/Frameworks/$CURR_VERSION.zip

clean:
    melos clean
    cd packages/vysma_design/native && cargo clean
