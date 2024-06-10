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
    case prepareError(message: String)
    case queryExecutionFailed(String)
}

class SQLiteCalculateRepository: Repository {
    
    typealias Entity = Calculate // Repository protocol에서 associatedtype을 Calculate로 지정
    
    let tableName: String = "Calculate"
    private let dbPath: String
    private var db: OpaquePointer?
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private let disposeBag = DisposeBag()
    
    var calculateData: [Calculate]?
    
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
        // id는 자동으로 생성(1씩 증가)
        let query = """
                    CREATE TABLE IF NOT EXISTS \(tableName) (
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
    
    func insert(_ calculate: Calculate) {
        let query = """
                    INSERT INTO \(tableName) (usage, price, user, userPrice, remainPrice, date)
                        VALUES (?, ?, ?, ?, ?, ?)
                    """
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (calculate.usage as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 2, Int32(calculate.price))
            sqlite3_bind_text(statement, 3, (calculate.user.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 4, Int32(calculate.userPrice))
            sqlite3_bind_int(statement, 5, Int32(calculate.remainPrice))
            sqlite3_bind_text(statement, 6, (calculate.date.toString() as NSString).utf8String, -1, nil)

            if sqlite3_step(statement) != SQLITE_DONE {
                let errorMsg = String(cString: sqlite3_errmsg(db))
                print("Insert 실패: \(errorMsg)")
            } else {
                print("데이터 삽입 성공!")
            }
        } else {
            let errorMsg = String(cString: sqlite3_errmsg(db))
            print("SQL 준비 실패: \(errorMsg)")
        }
        sqlite3_finalize(statement)
    }
    
    // calculate db 데이터를 calculateData에 저장
    func read() -> [Calculate]? {
        let query = "SELECT * FROM \(tableName)"
        var statement: OpaquePointer?
        
        if sqlite3_prepare(self.db, query, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(self.db)!)
            print("error preparing insert: v1\(errMsg)")
            return nil
        }
        
        self.calculateData = []
        
        while(sqlite3_step(statement) == SQLITE_ROW) {
            let id = Int(sqlite3_column_int(statement, 0))
            let usage = String(cString: sqlite3_column_text(statement, 1))
            let price = Int(sqlite3_column_int(statement, 2))
            let userName = String(cString: sqlite3_column_text(statement, 3))
            let userPrice = Int(sqlite3_column_int(statement, 4))
            let remainPrice = Int(sqlite3_column_int(statement, 5))
            var date: Date?
            if let dateString = sqlite3_column_text(statement, 6) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                date = dateFormatter.date(from: String(cString: dateString))
            }
            let user = Users(name: userName)
            let calculate = Calculate(id: id, usage: usage, price: price, user: user, userPrice: userPrice, remainPrice: remainPrice, date: date ?? Date())
            print(calculate, "calculate 각각 확인")
            print("머고")
            self.calculateData?.append(calculate)
        }
        
        sqlite3_finalize(statement)
        print("success read data!")
        print(self.calculateData, "전체 확인")
        return calculateData
    }
    
    func update(_ calculate: Calculate) {
        let query = """
                    UPDATE \(tableName)
                    SET usage = ?, price = ?, user = ?, userPrice = ?, remainPrice = ?, date = ?
                    WHERE id = ?
                    """
        var statement: OpaquePointer?
        
        guard sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK else {
            let errorMsg = String(cString: sqlite3_errmsg(db))
            print("SQL 준비 실패: \(errorMsg)")
            return
        }
        
        // 매개변수를 바인딩합니다.
        sqlite3_bind_text(statement, 1, (calculate.usage as NSString).utf8String, -1, nil)
        sqlite3_bind_int(statement, 2, Int32(calculate.price))
        sqlite3_bind_text(statement, 3, (calculate.user.name as NSString).utf8String, -1, nil)
        sqlite3_bind_int(statement, 4, Int32(calculate.userPrice))
        sqlite3_bind_int(statement, 5, Int32(calculate.remainPrice))
        sqlite3_bind_text(statement, 6, (calculate.date.toString() as NSString).utf8String, -1, nil)
        sqlite3_bind_int(statement, 7, Int32(calculate.id))
        
        // 쿼리 실행
        guard sqlite3_step(statement) == SQLITE_DONE else {
            let errorMsg = String(cString: sqlite3_errmsg(db))
            print("쿼리 실행 실패: \(errorMsg)")
            sqlite3_finalize(statement) // 리소스 정리
            return
        }
        
        // 리소스 정리
        sqlite3_finalize(statement)
        print("데이터 업데이트 성공!")
    }


    
    // 테이블 초기화 메서드 - 데이터 삭제
    func delete(by id: String) {
        let query = "DELETE FROM \(tableName)"
        _ = executeQuery(query: query).subscribe(onCompleted: {
            print("\(self.tableName) 테이블 데이터 삭제 완료")
        }, onError: { error in
            print("\(self.tableName) 테이블 데이터 삭제 실패: \(error)")
        })
    }
    
    deinit {
        sqlite3_close(db)
    }
}
