//
//  coredatahandler.swift
//  MyCoreData
//
//  Created by DCS on 16/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//
import  UIKit
import Foundation
import  CoreData

class coredatahandler {
    static let shared = coredatahandler()
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    let manageOnjectContext:NSManagedObjectContext?
    
    private init(){
        manageOnjectContext = appdelegate.persistentContainer.viewContext
    }
    
    func save(){
        appdelegate.saveContext()
    }
    func insert(sid:Int,name:String,email:String,gen:String,pass:String,cors:String){
        let stud = Student(context:manageOnjectContext!)
        stud.spid=Int64(sid)
        stud.name=name
        stud.email=email
        stud.gender=gen
        stud.password=pass
        stud.course=cors
        save()
    }
    func insertnotice(title:String,data:String,pdate:String,course:String){
        let noti = Noticeb(context:manageOnjectContext!)
        noti.title = title
        noti.data = data
        noti.pdate = pdate
        noti.course = course
        save()
    }
    func update(stud:Student,sid:Int,name:String,email:String,gen:String,pass:String,cors:String){
        stud.spid=Int64(sid)
        stud.name=name
        stud.email=email
        stud.gender=gen
        stud.password=pass
        stud.course=cors
        save()
    }
    func delete(emp:Student,completion: @escaping() -> Void ){
        manageOnjectContext!.delete(emp)
        save()
        completion()
    }
    func fetch() -> [Student]{
        let FetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        do{
            let stdArray = try manageOnjectContext?.fetch(FetchRequest)
            return stdArray!
        }catch{
            print(error)
            return [Student]()
        }
    }
}

