//
//  DataBase.swift
//  NewsAppMVVM
//
//  Created by Ruslan Sharshenov on 10.02.2022.
//

import Foundation
import RealmSwift

class DataBase {
    
    public static let shared = DataBase()
    
    private lazy var realm: Realm? = {
        do {
            return try Realm()
        } catch {
            return nil
        }
    }()
    
    func saveHistory(model: NewsModel) {
        do {
            try realm?.write{
                realm?.add(model)
            }
        } catch {
            print("DataBase not work saveHistory")
        }
    }
    
    func getHistory() -> Results<NewsModel>? {
        return realm?.objects(NewsModel.self)
    }
    
    func deleteAllHistory() {
        do {
            try realm?.write{
                realm?.deleteAll()
            }
        } catch { 
            print("DataBase not work saveHistory")
        }
    }
}
