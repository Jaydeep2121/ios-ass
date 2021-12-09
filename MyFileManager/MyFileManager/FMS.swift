//
//  FileManagerService.swift
//  MyFileManager
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class FMS {
    static func getDocDir() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask)
        print("Doc Dir:\(path[0])")
        return path[0]
    }
}
