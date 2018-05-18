//
//  FirebaseReference.swift
//  Foreign
//
//  Created by Aditya Bose on 4/28/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
import Firebase
enum DatabaseReferenceFile{
    case root
    case users(uid: String)
    // MARK: -Public
    func reference() -> DatabaseReference{
        switch self{
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
    }
    private var rootRef: DatabaseReference{
        let ref = Database.database().reference()
        return ref
    }
    private var path: String{
        switch self{
        case .root:
            return ""
        case .users(let uid):
            return "users/\(uid)"
        }
    }
}
