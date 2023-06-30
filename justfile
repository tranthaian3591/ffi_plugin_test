current_vesion := "v0.0.0"

run_macos_local:
  melos run build:apple
  cd packages/flutter_vysma_design/macos/ && rm -rf Frameworks && touch .gitkeep
  cp platform-build/VysmaDesignLayout.xcframework.zip packages/flutter_vysma_design/macos/Frameworks/{{current_vesion}}.zip
  cd packages/flutter_vysma_design/example/macos && rm Podfile.lock && pod install


# clean: 
#   melos clean
#   cd packages/vysma_design/native && cargo clean
