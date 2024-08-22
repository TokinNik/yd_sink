#!/bin/bash

archive_type=apk
build_type=--debug
file=lib/main_dev.dart

PS3='Choose archive type: '
options=("Android APK" "Android Bundle" "iOS ipa" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "Android APK")
            archive_type=apk
            break
            ;;
        "Android Bundle")
            archive_type=appbundle
            break
            ;;
        "iOS ipa")
            archive_type=ipa
            break
            ;;
        "quit")
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

PS3='Choose build type: '
options=("dev_profile" "prod_release" "demo_release" "quit")

select opt in "${options[@]}"
do
    case $opt in
        "dev_profile")
            build_type=--profile
            file=lib/main_dev.dart
            break
            ;;
          "prod_release")
            build_type=--release
            file=lib/main_prod.dart
            break
            ;;
          "demo_release")
            build_type=--release
            file=lib/main_demo.dart
            break
            ;;
        "quit")
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

sksl_file=flutter_01.sksl.json
case "$archive_type" in
 ipa) sksl_file=$sksl_file ;;
 appbundle) sksl_file=flutter_02.sksl.json ;;
 apk) sksl_file=flutter_02.sksl.json ;;
 *) sksl_file=$$sksl_file ;;
esac

#flutter build $archive_type $build_type -t $file --bundle-sksl-path $sksl_file
flutter build $archive_type $build_type -t $file