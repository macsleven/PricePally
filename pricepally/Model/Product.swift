//
//  Product.swift
//  pricepally
//
//  Created by Suleiman Abubakar on 25/02/2023.
//

import Foundation

struct Product: Codable {
    let productId: Int
    let categoryId: Int
    let categoryName: String
    let productName: String
    let discountStatus: Int
    let productPrice: String
    let productDiscount: Int
    let descriptionQuantity: String
    let unitName: String
    let unit: String
    let unitCost: String
    let isSeason: Int
    let productDescription: String
    let productImages: String
    let maxPallypeopleAllowed: Int
    let totalReviews: Int
    let productRating: String
    let isFav: Int
    let attributes: [String]
    
    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case categoryId = "category_id"
        case categoryName = "category_name"
        case productName = "product_name"
        case discountStatus = "discount_status"
        case productPrice = "product_price"
        case productDiscount = "product_discount"
        case descriptionQuantity = "description_quantity"
        case unitName = "unit_name"
        case unit
        case unitCost = "unit_cost"
        case isSeason = "is_season"
        case productDescription = "product_description"
        case productImages = "product_images"
        case maxPallypeopleAllowed = "max_pallypeople_allowed"
        case totalReviews = "total_reviews"
        case productRating = "product_rating"
        case isFav = "is_fav"
        case attributes = "Attributes"
    }
}

struct ProductResponse: Codable {
    let status: Bool
    let message: String
    let userAccess: Int
    let offset: Int
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case userAccess = "user_access"
        case offset
        case products
    }
}
