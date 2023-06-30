current_vesion := "v0.0.0"
lib_dir := "packages/vysma_design"
flutter_lib_dir := "packages/flutter_vysma_design"

build_macos_local:
  melos run build:apple
  cd {{flutter_lib_dir}}/macos/ && rm -rf Frameworks && mkdir Frameworks && touch Frameworks/.gitkeep
  cp platform-build/VysmaDesignLayout.xcframework.zip {{flutter_lib_dir}}/macos/Frameworks/{{current_vesion}}.zip
  cd {{flutter_lib_dir}}/example/macos && rm Podfile.lock && pod install

gen: clean
  melos bs
  cd {{lib_dir}}/native && cargo build -r

clean:
  melos clean
  cd {{lib_dir}}/native && cargo clean