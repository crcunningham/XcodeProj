import Foundation
import XCTest
import XcodeProj

final class PBXProductTypeTests: XCTestCase {

  // MARK: - Product type strings
  func test_none_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.none.rawValue, "")
  }

  func test_application_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.application.rawValue, "com.apple.product-type.application")
  }

  func test_framework_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.framework.rawValue, "com.apple.product-type.framework")
  }

  func test_dynamicLibrary_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.dynamicLibrary.rawValue, "com.apple.product-type.library.dynamic")
  }

  func test_staticLibrary_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.staticLibrary.rawValue, "com.apple.product-type.library.static")
  }

  func test_bundle_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.bundle.rawValue, "com.apple.product-type.bundle")
  }

  func test_unitTestBundle_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.unitTestBundle.rawValue, "com.apple.product-type.bundle.unit-test")
  }

  func test_uiTestBundle_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.uiTestBundle.rawValue, "com.apple.product-type.bundle.ui-testing")
  }

  func test_appExtension_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.appExtension.rawValue, "com.apple.product-type.app-extension")
  }

  func test_extensionKitExtension_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.extensionKitExtension.rawValue, "com.apple.product-type.extensionkit-extension"
    )
  }

  func test_commandLineTool_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.commandLineTool.rawValue, "com.apple.product-type.tool")
  }

  func test_watchApp_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.watchApp.rawValue, "com.apple.product-type.application.watchapp")
  }

  func test_watch2App_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.watch2App.rawValue, "com.apple.product-type.application.watchapp2")
  }

  func test_watchExtension_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.watchExtension.rawValue, "com.apple.product-type.watchkit-extension")
  }

  func test_watch2Extension_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.watch2Extension.rawValue, "com.apple.product-type.watchkit2-extension")
  }

  func test_tvExtension_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.tvExtension.rawValue, "com.apple.product-type.tv-app-extension")
  }

  func test_messagesApplication_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.messagesApplication.rawValue, "com.apple.product-type.application.messages")
  }

  func test_messagesExtension_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.messagesExtension.rawValue, "com.apple.product-type.app-extension.messages")
  }

  func test_stickerPack_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.stickerPack.rawValue,
      "com.apple.product-type.app-extension.messages-sticker-pack")
  }

  func test_xpcService_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.xpcService.rawValue, "com.apple.product-type.xpc-service")
  }

  func test_ocUnitTestBundle_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.ocUnitTestBundle.rawValue, "com.apple.product-type.bundle.ocunit-test")
  }

  func test_xcodeExtension_hasTheRightValue() {
    XCTAssertEqual(PBXProductType.xcodeExtension.rawValue, "com.apple.product-type.xcode-extension")
  }

  func test_intentsServiceExtension_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.intentsServiceExtension.rawValue,
      "com.apple.product-type.app-extension.intents-service")
  }

  func test_appClip_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.onDemandInstallCapableApplication.rawValue,
      "com.apple.product-type.application.on-demand-install-capable")
  }

  func test_driverExtension_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.driverExtension.rawValue, "com.apple.product-type.driver-extension")
  }

  func test_systemExtension_hasTheRightValue() {
    XCTAssertEqual(
      PBXProductType.systemExtension.rawValue, "com.apple.product-type.system-extension")
  }

  // MARK: - File extension
  func test_fileExtension_knownTypes() {
    XCTAssertEqual(PBXProductType.application.fileExtension, "app")
    XCTAssertEqual(PBXProductType.framework.fileExtension, "framework")
    XCTAssertEqual(PBXProductType.dynamicLibrary.fileExtension, "dylib")
    XCTAssertEqual(PBXProductType.staticLibrary.fileExtension, "a")
    XCTAssertEqual(PBXProductType.bundle.fileExtension, "bundle")
    XCTAssertEqual(PBXProductType.unitTestBundle.fileExtension, "xctest")
    XCTAssertEqual(PBXProductType.uiTestBundle.fileExtension, "xctest")
    XCTAssertEqual(PBXProductType.appExtension.fileExtension, "appex")
    XCTAssertEqual(PBXProductType.extensionKitExtension.fileExtension, "appex")
    XCTAssertEqual(PBXProductType.commandLineTool.fileExtension, nil)
    XCTAssertEqual(PBXProductType.watchApp.fileExtension, "app")
    XCTAssertEqual(PBXProductType.watch2App.fileExtension, "app")
    XCTAssertEqual(PBXProductType.watchExtension.fileExtension, "appex")
    XCTAssertEqual(PBXProductType.watch2Extension.fileExtension, "appex")
    XCTAssertEqual(PBXProductType.tvExtension.fileExtension, "appex")
    XCTAssertEqual(PBXProductType.messagesApplication.fileExtension, "app")
    XCTAssertEqual(PBXProductType.messagesExtension.fileExtension, "appex")
    XCTAssertEqual(PBXProductType.stickerPack.fileExtension, "appex")
    XCTAssertEqual(PBXProductType.xpcService.fileExtension, "xpc")
    XCTAssertEqual(PBXProductType.ocUnitTestBundle.fileExtension, "octest")
    XCTAssertEqual(PBXProductType.xcodeExtension.fileExtension, "appex")
    XCTAssertEqual(PBXProductType.intentsServiceExtension.fileExtension, "appex")
    XCTAssertEqual(PBXProductType.onDemandInstallCapableApplication.fileExtension, "app")
    XCTAssertEqual(PBXProductType.driverExtension.fileExtension, "dext")
    XCTAssertEqual(PBXProductType.systemExtension.fileExtension, "systemextension")
    XCTAssertEqual(PBXProductType.xcFramework.fileExtension, "xcframework")
    XCTAssertEqual(PBXProductType.metalLibrary.fileExtension, "metallib")
    XCTAssertEqual(PBXProductType.instrumentsPackage.fileExtension, "instrpkg")
    XCTAssertEqual(PBXProductType.none.fileExtension, nil)
  }

  // MARK: - Init
  func test_init_knownTypes() {
    XCTAssertEqual(PBXProductType(rawValue: ""), .none)
    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.application"), .application)
    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.framework"), .framework)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.framework.static"), .staticFramework)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.xcframework"), .xcFramework)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.library.dynamic"), .dynamicLibrary)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.library.static"), .staticLibrary)
    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.bundle"), .bundle)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.bundle.unit-test"), .unitTestBundle)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.bundle.ui-testing"), .uiTestBundle)
    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.app-extension"), .appExtension)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.extensionkit-extension"),
      .extensionKitExtension)
    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.tool"), .commandLineTool)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.application.watchapp"), .watchApp)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.application.watchapp2"), .watch2App)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.application.watchapp2-container"),
      .watch2AppContainer)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.watchkit-extension"), .watchExtension)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.watchkit2-extension"), .watch2Extension)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.tv-app-extension"), .tvExtension)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.application.messages"), .messagesApplication)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.app-extension.messages"), .messagesExtension)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.app-extension.messages-sticker-pack"),
      .stickerPack)
    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.xpc-service"), .xpcService)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.bundle.ocunit-test"), .ocUnitTestBundle)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.xcode-extension"), .xcodeExtension)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.instruments-package"), .instrumentsPackage)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.app-extension.intents-service"),
      .intentsServiceExtension)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.application.on-demand-install-capable"),
      .onDemandInstallCapableApplication)
    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.metal-library"), .metalLibrary)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.driver-extension"), .driverExtension)
    XCTAssertEqual(
      PBXProductType(rawValue: "com.apple.product-type.system-extension"), .systemExtension)
  }

  func test_init_unknownType() {
    XCTAssertNotNil(PBXProductType(rawValue: "com.apple.product-type.beeper"))
    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.beeper").fileExtension, nil)
  }

  func test_add_customType() {
    let customType = PBXProductType(rawValue: "com.apple.product-type.beeper")
    XCTAssertNil(customType)
    PBXProductType.addCustomType(customType, fileExtension: "beep")

    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.beeper"), customType)
    XCTAssertEqual(PBXProductType(rawValue: "com.apple.product-type.beeper").fileExtension, "beep")
  }
}
