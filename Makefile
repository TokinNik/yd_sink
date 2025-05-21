.PHONY: build

all: pub gen build

pub: 
	flutter pub get

gen:
	dart run build_runner build --delete-conflicting-outputs
	
gen_watch:
	dart run build_runner watch --delete-conflicting-outputs

build:
	@echo "Run code generation"
	make gen;
	@echo "Choose archive type:"
	@echo "1) Android APK"
	@echo "2) Android Bundle"
	@echo "3) iOS ipa"
	@echo "4) Quit"
	@read -p "Enter choice: " target_choice; \
	case $$target_choice in \
		1) archive_type="apk"; output_dir="build/app/outputs/flutter-apk" ;; \
		2) archive_type="appbundle"; output_dir="build/app/outputs/bundle" ;; \
		3) archive_type="ipa"; output_dir="build/ios/ipa" ;; \
		4) exit ;; \
		*) echo "Invalid option" && exit 1 ;; \
	esac; \
	\
	echo "Choose build mode:"; \
	echo "1) Debug"; \
	echo "2) Profile"; \
	echo "3) Release"; \
	read -p "Enter choice: " mode_choice; \
	case $$mode_choice in \
		1) build_mode="debug"; flutter_mode="--debug" ;; \
		2) build_mode="profile"; flutter_mode="--profile" ;; \
		3) build_mode="release"; flutter_mode="--release" ;; \
		*) echo "Invalid option" && exit 1 ;; \
	esac; \
	\
	echo "Scanning files in lib/..."; \
	files=$$(ls lib/*.dart); \
	echo "Available targets:"; \
	select file in $$files "Quit"; do \
		if [ "$$file" = "Quit" ]; then \
			exit; \
		elif [ -n "$$file" ]; then \
			file_name=$$(basename $$file); \
			file_name=$$(echo $$file_name | sed 's/^main_//' | sed 's/\.dart//'); \
			break; \
		else \
			echo "Invalid option"; \
		fi; \
	done; \
	\
	project_name=$$(grep '^name:' pubspec.yaml | awk '{print $$2}'); \
	version=$$(grep '^version:' pubspec.yaml | awk '{print $$2}'); \
	echo "Detected version: $$version"; \
	\
	echo "Running: flutter build $$archive_type $$flutter_mode -t $$file"; \
	flutter build $$archive_type $$flutter_mode -t $$file; \
	\
	case $$archive_type in \
		apk) original_file="$$output_dir/app-$$build_mode.apk" ;; \
		appbundle) original_file="$$output_dir/app-$$build_mode.aab" ;; \
		ipa) original_file=$$(ls $$output_dir/*.ipa | head -n 1) ;; \
	esac; \
	new_file="$$output_dir/$${file_name}_$${build_mode}_v$${version}_$${project_name}.$$archive_type"; \
	mv "$$original_file" "$$new_file"; \
	echo "File renamed to: $$new_file"; \
	\
	xdg-open "$$output_dir" 2>/dev/null || open "$$output_dir" 2>/dev/null || echo "Could not open output directory."
