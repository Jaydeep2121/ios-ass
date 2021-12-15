//
//  SqliteHandler.swift
//  Ass11
//
//  Created by DCS on 15/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import SQLite3

class SqliteHandler {
    static let shared = SqliteHandler()
    let dbpath = "empdb.sqllite"
    var db:OpaquePointer?
    private init(){
        db = opendatabase()
        createtable()
    }
    private func opendatabase()->OpaquePointer?{
        let docurl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileurl = docurl.appendingPathComponent(dbpath)
        
        var database:OpaquePointer? = nil
        if sqlite3_open(fileurl.path,&database) == SQLITE_OK {
            print("Opened connection to the database successfully at: \(fileurl)")
            return database
        }else{
            print("error connecting to the database")
            return nil
        }
    }
    private func createtable(){
        let createTableString = """
            CREATE TABLE IF NOT EXISTS student(
                spid INTEGER PRIMARY KEY,
                name TEXT,
                email TEXT,
                gender TEXT,
                password TEXT,
                course TEXT);
        """
        var creatTableStatement:OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &creatTableStatement, nil) == SQLITE_OK{
            if sqlite3_step(creatTableStatement)==SQLITE_DONE {
                print("student created")
            }else{
                print("student no created")
            }
        }else{
            print("student table not prepared")
        }
        sqlite3_finalize(creatTableStatement)
    }
}
