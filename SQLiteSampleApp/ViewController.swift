//
//  ViewController.swift
//  SQLiteSampleApp
//
//  Created by user181504 on 2020/12/21.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    var db: OpaquePointer?
    var dbfile: String = "sample.db"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.dbfile)
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error: database file open error.")
        }

        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS foobar (id INTEGER PRIMARY KEY AUTOINCREMENT, guid TEXT)", nil, nil, nil) != SQLITE_OK {
            print("Error: SQL execution error.")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

