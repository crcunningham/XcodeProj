import Foundation
@_implementationOnly import NIOConcurrencyHelpers

public struct PBXProductType: RawRepresentable, Decodable, Hashable {
  public var rawValue: String

  public static let none = PBXProductType(rawValue: "")
  public static let application = PBXProductType(rawValue: "com.apple.product-type.application")
  public static let framework = PBXProductType(rawValue: "com.apple.product-type.framework")
  public static let staticFramework = PBXProductType(
    rawValue: "com.apple.product-type.framework.static")
  public static let xcFramework = PBXProductType(rawValue: "com.apple.product-type.xcframework")
  public static let dynamicLibrary = PBXProductType(
    rawValue: "com.apple.product-type.library.dynamic")
  public static let staticLibrary = PBXProductType(
    rawValue: "com.apple.product-type.library.static")
  public static let bundle = PBXProductType(rawValue: "com.apple.product-type.bundle")
  public static let unitTestBundle = PBXProductType(
    rawValue: "com.apple.product-type.bundle.unit-test")
  public static let uiTestBundle = PBXProductType(
    rawValue: "com.apple.product-type.bundle.ui-testing")
  public static let appExtension = PBXProductType(rawValue: "com.apple.product-type.app-extension")
  public static let extensionKitExtension = PBXProductType(
    rawValue: "com.apple.product-type.extensionkit-extension")
  public static let commandLineTool = PBXProductType(rawValue: "com.apple.product-type.tool")
  public static let watchApp = PBXProductType(
    rawValue: "com.apple.product-type.application.watchapp")
  public static let watch2App = PBXProductType(
    rawValue: "com.apple.product-type.application.watchapp2")
  public static let watch2AppContainer = PBXProductType(
    rawValue: "com.apple.product-type.application.watchapp2-container")
  public static let watchExtension = PBXProductType(
    rawValue: "com.apple.product-type.watchkit-extension")
  public static let watch2Extension = PBXProductType(
    rawValue: "com.apple.product-type.watchkit2-extension")
  public static let tvExtension = PBXProductType(
    rawValue: "com.apple.product-type.tv-app-extension")
  public static let messagesApplication = PBXProductType(
    rawValue: "com.apple.product-type.application.messages")
  public static let messagesExtension = PBXProductType(
    rawValue: "com.apple.product-type.app-extension.messages")
  public static let stickerPack = PBXProductType(
    rawValue: "com.apple.product-type.app-extension.messages-sticker-pack")
  public static let xpcService = PBXProductType(rawValue: "com.apple.product-type.xpc-service")
  public static let ocUnitTestBundle = PBXProductType(
    rawValue: "com.apple.product-type.bundle.ocunit-test")
  public static let xcodeExtension = PBXProductType(
    rawValue: "com.apple.product-type.xcode-extension")
  public static let instrumentsPackage = PBXProductType(
    rawValue: "com.apple.product-type.instruments-package")
  public static let intentsServiceExtension = PBXProductType(
    rawValue: "com.apple.product-type.app-extension.intents-service")
  public static let onDemandInstallCapableApplication = PBXProductType(
    rawValue: "com.apple.product-type.application.on-demand-install-capable")
  public static let metalLibrary = PBXProductType(rawValue: "com.apple.product-type.metal-library")
  public static let driverExtension = PBXProductType(
    rawValue: "com.apple.product-type.driver-extension")
  public static let systemExtension = PBXProductType(
    rawValue: "com.apple.product-type.system-extension")

  public static let knownTypes: [PBXProductType] = [
    .none,
    .application,
    .framework,
    .staticFramework,
    .xcFramework,
    .dynamicLibrary,
    .staticLibrary,
    .bundle,
    .unitTestBundle,
    .uiTestBundle,
    .appExtension,
    .extensionKitExtension,
    .commandLineTool,
    .watchApp,
    .watch2App,
    .watch2AppContainer,
    .watchExtension,
    .watch2Extension,
    .tvExtension,
    .messagesApplication,
    .messagesExtension,
    .stickerPack,
    .xpcService,
    .ocUnitTestBundle,
    .xcodeExtension,
    .instrumentsPackage,
    .intentsServiceExtension,
    .onDemandInstallCapableApplication,
    .metalLibrary,
    .driverExtension,
    .systemExtension,
  ]

  public init(rawValue: String) {
    self.rawValue = rawValue
  }

  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(rawValue)
  }

  // MARK: - Custom Product Types
  private struct PBXCustomProductType: Hashable {
    var productType: PBXProductType
    var fileExtension: String?

    static func == (_ lhs: Self, _ rhs: Self) -> Bool {
      return lhs.productType == rhs.productType && lhs.fileExtension == rhs.fileExtension
    }

    func hash(into hasher: inout Hasher) {
      hasher.combine(productType)
      hasher.combine(fileExtension)
    }
  }

  private static let _customTypes = NIOLockedValueBox<Set<PBXCustomProductType>>([])

  /// Adds a custom product type to the list of known types. Thread-safe.
  public static func addCustomType(_ type: PBXProductType, fileExtension: String?) {
    guard !knownTypes.contains(type) else { return }

    let customType = PBXCustomProductType(productType: type, fileExtension: fileExtension)
    let _ = _customTypes.withLockedValue {
      $0.insert(customType)
    }
  }

  /// Returns the file extension for the given product type.
  public var fileExtension: String? {
    switch self {
    case PBXProductType.application, PBXProductType.watchApp, PBXProductType.watch2App,
      PBXProductType.watch2AppContainer, PBXProductType.messagesApplication,
      PBXProductType.onDemandInstallCapableApplication:
      return "app"
    case PBXProductType.framework, PBXProductType.staticFramework:
      return "framework"
    case PBXProductType.dynamicLibrary:
      return "dylib"
    case PBXProductType.staticLibrary:
      return "a"
    case PBXProductType.bundle:
      return "bundle"
    case PBXProductType.unitTestBundle, PBXProductType.uiTestBundle:
      return "xctest"
    case PBXProductType.appExtension, PBXProductType.extensionKitExtension,
      PBXProductType.tvExtension, PBXProductType.watchExtension, PBXProductType.watch2Extension,
      PBXProductType.messagesExtension, PBXProductType.stickerPack, PBXProductType.xcodeExtension,
      PBXProductType.intentsServiceExtension:
      return "appex"
    case PBXProductType.commandLineTool:
      return nil
    case PBXProductType.xpcService:
      return "xpc"
    case PBXProductType.ocUnitTestBundle:
      return "octest"
    case PBXProductType.instrumentsPackage:
      return "instrpkg"
    case PBXProductType.xcFramework:
      return "xcframework"
    case PBXProductType.metalLibrary:
      return "metallib"
    case PBXProductType.systemExtension:
      return "systemextension"
    case PBXProductType.driverExtension:
      return "dext"
    case PBXProductType.none:
      return nil
    default:
      // fall back to a custom type
      let custom = Self._customTypes.withLockedValue { $0 }
      return custom.first { $0.productType == self }?.fileExtension
    }
  }
}
