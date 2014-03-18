default:
	xcodebuild -workspace singcafe.xcworkspace -scheme singcafe -configuration Release -sdk iphoneos clean build

adhoc:
	if [ -a build]; then rm -R build; fi;
	xcodebuild -sdk iphoneos -workspace singcafe.xcworkspace -scheme singcafe -configuration Release clean build CONFIGURATION_BUILD_DIR=$(PWD)/build PROVISIONING_PROFILE=BA26D7B6-2046-4E56-A131-01260710487C
	xcrun -sdk iphoneos PackageApplication build/singcafe.app -o $(PWD)/build/singcafe.ipa --embed singcafe-testflight.mobileprovision
