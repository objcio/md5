import Foundation
#if os(macOS)
import CommonCrypto
#else
import Cmd5
#endif

extension UnsafeRawBufferPointer {
    public func md5() -> Data {
        #if os(macOS)
        let digestLength = Int(CC_MD5_DIGEST_LENGTH)
        #else
        let digestLength = Int(MD5_DIGEST_LENGTH)
        #endif
        var result = Data(repeating: 0, count: digestLength)
        let base = baseAddress!
        result.withUnsafeMutableBytes { r in
            let resultBase = r.baseAddress!.assumingMemoryBound(to: UInt8.self)
            #if os(macOS)
            CC_MD5(base, CC_LONG(count), resultBase)
            #else
            let pointer = base.assumingMemoryBound(to: UInt8.self)
            MD5(pointer, count, resultBase)
            #endif
        }
        return result
    }
}

extension Data {
    public func md5() -> Data {
        return withUnsafeBytes { $0.md5() }
    }
}
