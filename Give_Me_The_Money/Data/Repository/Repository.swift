//
//  Repository.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 6/6/24.
//

import Foundation

// Entity로 매개 변수 타입을 protocol을 사용하기 전까지는 지정하지 않음 (Any와 비슷?)
protocol Repository {
    associatedtype Entity
    
    func create(_ item: Entity)
    func read(by id: String) -> Entity?
    func update(_ item: Entity)
    func delete(by id: String)
}
