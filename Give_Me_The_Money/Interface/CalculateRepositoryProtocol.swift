//
//  Repository.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 6/6/24.
//

import Foundation

// Entity로 매개 변수 타입을 protocol을 사용하기 전까지는 지정하지 않음 (Any와 비슷?)
protocol CalculateRepositoryProtocol {
    associatedtype Entity
    
    func insert(_ item: Entity)
    func read() -> [Entity]? // repository에서는 전체를 읽어오고 usecase나 다른 viewModel에서 원하는 값 추출
    func update(_ item: Entity)
    func delete(by id: String)
}
