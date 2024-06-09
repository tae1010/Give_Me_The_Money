//
//  DefaultCalculateRepository.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 3/5/24.
//

import Foundation
import RxSwift
import SQLite3

enum DatabaseError: Error {
    case queryExecutionFailed(String)
}

class SQLiteCalculateRepository: Repository {
    
    typealias Entity = Calculate // Repository protocol에서 associatedtype을 Calculate로 지정
    
    private let dbPath: String
    private var db: OpaquePointer?
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private let disposeBag = DisposeBag()

    init() {
        self.dbPath = documentsDirectory.appendingPathComponent("database.sqlite").path
        if sqlite3_open(dbPath, &db) != SQLITE_OK {
            print("Error opening SQLite database.")
        }
        createTable()
    }
    
    // 쿼리 실행
    // Completable은 성공과 실패만 처리 (completete, error)
    func executeQuery(query: String) -> Completable {
        return Completable.create { completable in
            if sqlite3_exec(self.db, query, nil, nil, nil) != SQLITE_OK {
                let errorMsg = String(cString: sqlite3_errmsg(self.db))
                print("쿼리 실행 실패: \(errorMsg)")
                completable(.error(DatabaseError.queryExecutionFailed(errorMsg)))
            } else {
                print("쿼리 실행 성공!")
                completable(.completed)
            }
            return Disposables.create()
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
        _ = executeQuery(query: query).subscribe()
    }
    
    func insert(calculate: Calculate) -> Completable {
        let query = """
                    INSERT INTO Calculate (id, usage, price, user, userPrice, remainPrice, date)
                        VALUES ('\(calculate.id)', '\(calculate.usage)', '\(calculate.price)', '\(calculate.user)', '\(calculate.userPrice)', '\(calculate.remainPrice)', '\(calculate.date)')
                    """
        return executeQuery(query: query)
    }
    
    func read(by id: String) -> Calculate? {
        <#code#>
    }
    
    func update(_ item: Calculate) {
        <#code#>
    }
    
    func delete(by id: String) {
        <#code#>
    }
    
    deinit {
        sqlite3_close(db)
    }
}

enum SQLiteError: Error {
    case prepareError(message: String)
    case executeError(message: String)
}
