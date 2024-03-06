//
//  DefaultCalculateRepository.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 3/5/24.
//

import Foundation
import SQLite3

protocol CalculateRepository {
    func create(calculate: Calculate) throws
    func read() throws -> [Calculate]
    func update(calculate: Calculate) throws
    func delete(id: Int) throws
}

class SQLiteCalculateRepository: CalculateRepository {
    private let dbPath: String
    private var db: OpaquePointer?

    init() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.dbPath = documentsDirectory.appendingPathComponent("database.sqlite").path
        if sqlite3_open(dbPath, &db) != SQLITE_OK {
            print("Error opening SQLite database.")
        }
        createTable()
    }

    deinit {
        sqlite3_close(db)
    }

    // 쿼리 실행
    private func executeQuery(query: String) throws {
        var statement: OpaquePointer?
        guard sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK else {
            throw SQLiteError.prepareError(message: "Error preparing SQL statement.")
        }
        defer {
            sqlite3_finalize(statement)
        }
        if sqlite3_step(statement) != SQLITE_DONE {
            throw SQLiteError.executeError(message: "Error executing SQL statement.")
        }
    }

    // 테이블 생성
    private func createTable() {
        let query = """
                    CREATE TABLE IF NOT EXISTS Calculate (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        usage TEXT,
                        price INTEGER,
                        user TEXT,
                        userPrice INTEGER,
                        remainPrice INTEGER,
                        date TEXT
                    );
                    """
        do {
            try executeQuery(query: query)
        } catch {
            print("Error creating table: \(error)")
        }
    }

    // insert
    func create(calculate: Calculate) throws {
        let query = """
                INSERT INTO Calculate (id, usage, price, user, userPrice, remainPrice, date)
                VALUES ('\(calculate.id)', '\(calculate.usage)', '\(calculate.price)', '\(calculate.user)', '\(calculate.userPrice)', '\(calculate.remainPrice)', '\(calculate.date)')
                """
        try executeQuery(query: query)
    }

    // read
    func read() throws -> [Calculate] {
        var calculates = [Calculate]()
        let query = "SELECT * FROM Calculate"
        var statement: OpaquePointer?
        guard sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK else {
            throw SQLiteError.prepareError(message: "Error preparing SQL statement.")
        }
        defer {
            sqlite3_finalize(statement)
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let id = Int(sqlite3_column_int(statement, 1))
            let usage = String(cString: sqlite3_column_text(statement, 2))
            let price = Int(sqlite3_column_int(statement, 3))
            let userName = String(cString: sqlite3_column_text(statement, 4))
            let userPrice = Int(sqlite3_column_int(statement, 5))
            let remainPrice = Int(sqlite3_column_int(statement, 6))
            
            var date: Date?
            if let dateString = sqlite3_column_text(statement, 7) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                date = dateFormatter.date(from: String(cString: dateString))
            }
            
            let user = Users(name: userName)
            let calculate = Calculate(id: id, usage: usage, price: price, user: user, userPrice: userPrice, remainPrice: remainPrice, date: date ?? Date())

            calculates.append(calculate)
        }
        return calculates
    }

    // update
    func update(calculate: Calculate) throws {

        let query = """
                    UPDATE Calculate
                    SET usage = '\(calculate.usage), price = \(calculate.price), userName = \(calculate.user), userPrice = \(calculate.userPrice), remainPrice = \(calculate.remainPrice), date = \(calculate.date)'
                    WHERE id = \(calculate.id)
                    """
        try executeQuery(query: query)
    }

    // delete
    func delete(id: Int) throws {
        let query = "DELETE FROM Calculate WHERE id = \(id)"
        try executeQuery(query: query)
    }
    
    // 테이블 삭제
    func dropTable(table: String) {
        let tableName = table

        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("database.sqlite")

        var db: OpaquePointer?
        if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
            let dropTableQuery = "DROP TABLE IF EXISTS \(tableName)"
            if sqlite3_exec(db, dropTableQuery, nil, nil, nil) == SQLITE_OK {
                print("Table dropped successfully.")
            } else {
                print("Failed to drop table.")
            }
            sqlite3_close(db)
        }
    }
}

enum SQLiteError: Error {
    case prepareError(message: String)
    case executeError(message: String)
    case invalidId(message: String)
}
