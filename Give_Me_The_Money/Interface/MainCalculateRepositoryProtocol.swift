//
//  MainCalculateRepositoryProtocol.swift
//  Give_Me_The_Money
//
//  Created by 김정태 on 6/12/24.
//

import Foundation

protocol MainCalculateRepositoryProtocol {
    associatedtype Entity
    
    func insert(_ item: Entity)
    func read() -> Entity? // repository에서는 전체를 읽어오고 usecase나 다른 viewModel에서 원하는 값 추출
    func update(_ item: Entity)
    func delete(id: String)
}
