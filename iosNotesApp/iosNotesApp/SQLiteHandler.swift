//
//  SQLiteHandler.swift
//  iosNotesApp
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteHandler{
    static let shared = SQLiteHandler()
    
    let dbpath = "empdb.sqlite"
    var db:OpaquePointer?
    
    private init(){
        db = OpenDatabase()
        createTable()
    }
    
    func OpenDatabase() -> OpaquePointer? {
        let docurl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileurl = docurl.appendingPathComponent(dbpath)
        
        var database:OpaquePointer? = nil
        
        if sqlite3_open(fileurl.path, &database) == SQLITE_OK {
            print("Opened Connection to database success at \(fileurl)")
            return database
        }else{
            print("Error connecting to the database")
            return nil
        }
    }
    func createTable() {
        
        let createTableString = """
            CREATE TABLE IF NOT EXISTS emp(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                age INTEGER,
                phone TEXT
            );
        """
        //statement handle
        var createTableStatement:OpaquePointer? = nil
        
        //prepare statement
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK{
                //evalute statement
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("emp table created")
            }else{
                print("emp table could not be created")
            }
        }else{
            print("Emp table could not be prepared")
        }
        //delete statement
        sqlite3_finalize(createTableStatement)
    }
    
    func  insert(emp:Employee,completion:@escaping((Bool)->Void)) {
        let insertStatementString = "INSERT INTO emp(name,age,phone)values(?,?,?);"
        
        var insertStatement:OpaquePointer? = nil
        
        //prepare statement
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK{
            sqlite3_bind_text(insertStatement, 1,(emp.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 2, Int32(emp.age))
            sqlite3_bind_text(insertStatement, 3, (emp.phone as NSString).utf8String, -1, nil)
            
            //evalute statement
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("Insert Row successfully")
                completion(true)
            }else{
                print("not insert")
                completion(false)
            }
        }else{
            print("insert statement not prepared")
            completion(false)
        }
        
        sqlite3_finalize(insertStatement)
    }
    
    func update(emp:Employee,completion:@escaping((Bool)->Void)) {
        let updateStatementString = "update emp set name = ?,age = ?,phone = ? where id = ?;"
        
        var updateStatement:OpaquePointer? = nil
        
        //prepare statement
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK{
            
            sqlite3_bind_text(updateStatement, 1,(emp.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateStatement, 2, Int32(emp.age))
            sqlite3_bind_text(updateStatement, 3, (emp.phone as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateStatement, 4, Int32(emp.id))
            //evalute statement
            if sqlite3_step(updateStatement) == SQLITE_DONE{
                print("update Row successfully")
                completion(true)
            }else{
                print("not update")
                completion(false)
            }
        }else{
            print("update statement not prepared")
            completion(false)
        }
        
        sqlite3_finalize(updateStatement)
    }
    
    func fetch()->[Employee] {
        let fetchStatementString = "select * from emp;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var emp = [Employee]()
        //prepare statement
        if sqlite3_prepare_v2(db, fetchStatementString, -1, &fetchStatement, nil) == SQLITE_OK{
            
            //evalute statement
            if sqlite3_step(fetchStatement) == SQLITE_ROW{
                print("fetch Row successfully")
                
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let name = String(cString:sqlite3_column_text(fetchStatement, 1))
                let age = Int(sqlite3_column_int(fetchStatement, 2))
                let phone = String(cString: sqlite3_column_text(fetchStatement, 3))
                
                emp.append(Employee(id: id, Name: name, age: age, phone: phone))
                print("\(id) | \(name) | \(age) | \(phone)")
            }else{
                print("not fetch")
            }
        }else{
            print("fetch statement not prepared")
        }
        
        sqlite3_finalize(fetchStatement)
        return emp
    }
    
    func delete(emp:Employee,completion:@escaping((Bool)->Void)) {
        let deleteStatementString = "delete from emp where id = ?;"
        
        var deleteStatement:OpaquePointer? = nil
        
        //prepare statement
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK{
            
            sqlite3_bind_int(deleteStatement, 1, Int32(emp.id))
            
            //evalute statement
            if sqlite3_step(deleteStatement) == SQLITE_DONE{
                print("update Row successfully")
                completion(true)
            }else{
                print("not update")
                completion(false)
            }
        }else{
            print("update statement not prepared")
            completion(false)
        }
        
        sqlite3_finalize(deleteStatement)
    }
}
