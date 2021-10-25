//
//  ViewController.swift
//  Generics
//
//  Created by user on 24.10.2021.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

// Это я просто интересный пример
public final class WeakReference<T> where T: AnyObject {
	private(set) weak var value: T?

	init(value: T?) {
		self.value = value
	}
}

extension WeakReference {
	var isNotEmpty: Bool { value != nil }
}
// Пример взаимодействия дженериков в архитектуре Clean в проекте котором я работаю

// Пусть есть модель для товаров
struct ProductDetailsModel {
	var id: Int
	var productName: String
}

// Есть дженерик енам который в зависимости от результата обрабатывает ответ от сервера
enum GenericModuleRequestResult<T> {
	case success(T)
	case failure(Error)
}

// Есть енам для взаимодействия между модулями VIP
enum ProductDetails {
	enum Load {
		// Для интерактора
		struct Request {
		}
		
		// Для презентера
		struct Response {
			// И вот тут мы использвуем наш дженерик енам для обработки результата
			let result: GenericModuleRequestResult<ProductDetailsModel>
			
			init(result: GenericModuleRequestResult<ProductDetailsModel>) {
				self.result = result
			}
		}
	}
}

// Функция для получения данных из сети, находиться в интеракторе
func getProductDetails(request: ProductDetails.Load.Request) {
	// получение данных из сети
}

// Функция для отображения данных, который находиться в презенторе
func presentProductDetails(response: ProductDetails.Load.Response) {
	switch response.result {
	case let .failure(error): break
		//handleError()

	case let .success(productDetails): break
	}
}

