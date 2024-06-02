//
//  DefaultCalculateRepository.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 3/5/24.
//

import Foundation
import RxSwift
import SQLite3

protocol CalculateRepository {
    func create(calculate: MainCalculate) -> Completable
    func read() -> Single<[MainCalculate]>
    func update(calculate: MainCalculate) -> Completable
    func delete(id: Int) -> MainCalculate
}

class SQLiteCalculateRepository: CalculateRepository {
    private let dbPath: String
    private var db: OpaquePointer?
    private let disposeBag = DisposeBag()

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

    private func executeQuery(query: String) -> Completable {
        return Completable.create { [weak self] completable in
            guard let self = self else { return Disposables.create() }
            var statement: OpaquePointer?
            if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
                if sqlite3_step(statement) == SQLITE_DONE {
                    completable(.completed)
                } else {
                    completable(.error(SQLiteError.executeError(message: "Error executing SQL statement.")))
                }
            } else {
                completable(.error(SQLiteError.prepareError(message: "Error preparing SQL statement.")))
            }
            sqlite3_finalize(statement)
            return Disposables.create()
        }
    }

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
        _ = executeQuery(query: query).subscribe()
    }

    func create(calculate: MainCalculate) -> Completable {
        let query = """
                INSERT INTO Calculate (id, usage, price, user, userPrice, remainPrice, date)
                VALUES ('\(calculate.id)', '\(calculate.usage)', '\(calculate.price)', '\(calculate.user)', '\(calculate.userPrice)', '\(calculate.remainPrice)', '\(calculate.date)')
                """
        return executeQuery(query: query)
    }

    func read() -> Single<[MainCalculate]> {
        return Single.create { [weak self] single in
            guard let self = self else { return Disposables.create() }
            var calculates = [Calculate]()
            let query = "SELECT * FROM Calculate"
            var statement: OpaquePointer?
            if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
                defer { sqlite3_finalize(statement) }
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
                single(.success(calculates))
            } else {
                let error = SQLiteError.prepareError(message: "Error preparing SQL statement.")
                single(.failure(error))
            }
            return Disposables.create()
        }
    }

    func update(calculate: MainCalculate) -> Completable {
        let query = """
                    UPDATE Calculate
                    SET usage = '\(calculate.usage), price = \(calculate.price), userName = \(calculate.user), userPrice = \(calculate.userPrice), remainPrice = \(calculate.remainPrice), date = \(calculate.date)'
                    WHERE id = \(calculate.id)
                    """
        return executeQuery(query: query)
    }

    func delete(id: Int) -> Completable {
        let query = "DELETE FROM Calculate WHERE id = \(id)"
        return executeQuery(query: query)
    }
}

enum SQLiteError: Error {
    case prepareError(message: String)
    case executeError(message: String)
}
