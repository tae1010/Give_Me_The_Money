//
//  MainSQLiteCalculateRepository.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 6/12/24.
//

import Foundation
import RxSwift
import SQLite3


class MainSQLiteCalculateRepository: MainCalculateRepositoryProtocol {
    
    typealias Entity = MainCalculate // Repository protocol에서 associatedtype을 Calculate로 지정
    
    let tableName: String = "MainCalculate"
    private let dbPath: String
    private var db: OpaquePointer?
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // 기기 로컬 위치
    private let disposeBag = DisposeBag()
    
    var mainCalculateData: [MainCalculate]?
    
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
                        totalPrice INTEGER
                    );
                    """
        _ = executeQuery(query: query).subscribe()
    }
    
    func insert(_ mainCalculate: MainCalculate) {
        let query = """
                    INSERT INTO \(tableName) (usage, totalPrice)
                        VALUES (?, ?)
                    """
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (mainCalculate.titleUsage as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 2, Int32(mainCalculate.totalPrice))
            
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
    func read() -> [MainCalculate]? {
        let query = "SELECT * FROM \(tableName)"
        var statement: OpaquePointer?
        
        if sqlite3_prepare(self.db, query, -1, &statement, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(self.db)!)
            print("error preparing insert: v1\(errMsg)")
            return nil
        }
        
        self.mainCalculateData = []
        
        while(sqlite3_step(statement) == SQLITE_ROW) {
            let id = Int(sqlite3_column_int(statement, 0))
            let titleUsage = String(cString: sqlite3_column_text(statement, 1))
            let totalPrice = Int(sqlite3_column_int(statement, 2))
            
            let mainCalculate = MainCalculate(id: id, titleUsage: titleUsage, totalPrice: totalPrice)
            
            self.mainCalculateData?.append(mainCalculate)
        }
        
        sqlite3_finalize(statement)
        print("success read data!")
        
        return mainCalculateData
    }
    
    func update(_ mainCalculate: MainCalculate) {
        let query = """
                    UPDATE \(tableName)
                    SET titleUsage = ?, totalPrice = ?
                    WHERE id = ?
                    """
        var statement: OpaquePointer?
        
        guard sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK else {
            let errorMsg = String(cString: sqlite3_errmsg(db))
            print("SQL 준비 실패: \(errorMsg)")
            return
        }
        
        // 매개변수를 바인딩
        sqlite3_bind_text(statement, 1, (mainCalculate.titleUsage as NSString).utf8String, -1, nil)
        sqlite3_bind_int(statement, 2, Int32(mainCalculate.totalPrice))
        sqlite3_bind_int(statement, 3, Int32(mainCalculate.id))
        
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
    func delete(id: String) {
        let query = "DELETE FROM \(tableName)"
        _ = executeQuery(query: query)
    }
    
    deinit {
        sqlite3_close(db)
    }
}
