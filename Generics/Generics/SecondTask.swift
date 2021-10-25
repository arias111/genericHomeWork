//
//  SecondTask.swift
//  Generics
//
//  Created by user on 24.10.2021.
//

import Foundation

// Пример с протоколами

struct ProductsDetailsModel {
	var id: Int
	var productName: String
}

// Когда посмотрите домашку с чатом вы увидите что я использую MVVM, там я создаю ViewModel для работы с таблицей, фунция numberOfRows -
// - которая возвращает кол во строк( это в чате не тут) и там есть фунция которая заполняет ячейку таблицы cellForRowAt
// И вот для примера я подумал может можно создать один протокол для многоразового использования ( для каждого модуля в чате я создавал отдельный протокол)
// Пример как можно, наверно, усовершенстовать тот код

protocol ViewModelProtocol {
	associatedtype ModelType
	
	func cellForRowAt() -> ModelType
}

class ViewModel: ViewModelProtocol {
	
	typealias ModelType = ProductsDetailsModel
	
	func cellForRowAt() -> ProductsDetailsModel {
		let model = ProductsDetailsModel(id: 2, productName: "product")
		return model
	}
}
