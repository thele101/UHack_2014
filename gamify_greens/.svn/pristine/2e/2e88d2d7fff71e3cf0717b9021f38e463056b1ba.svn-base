package gamify_greens

import groovy.json.JsonSlurper

class DefaultService {		
	
	String base = "https://api.target.com/v2/products/"
	String idType = "TCIN"
	String apiKey = "J5PsS2XGuqCnkdQq0Let6RSfvU7oyPwF"
	
	def product_factory(url)
	{
		//author: Hunter Kievet 3:42 AM
		//Get product details api
		//Given a url this will return a java object product
		Product product = new Product();
		def object_data = [:]
		//get the data from url
		def data = new JsonSlurper().parse(new URL(url))
		//Figured out all of this from analyzing the json 
		object_data["price"] = data.CatalogEntryView.Offers.OfferPrice.formattedPriceValue[0][0][0].toString().substring(1).toFloat();
		object_data["brand_name"] = data.CatalogEntryView.manufacturer[0].toString()
		object_data["description"] = data.CatalogEntryView.shortDescription[0].toString()
		object_data["product_id"] = data.CatalogEntryView.partNumber[0].toString()
		object_data["product_name"] = data.CatalogEntryView.title[0].toString()
		
		product.setPrice(object_data.price)
		product.setProductBrandName(object_data.brand_name)
		product.setProductDescription(object_data.description)
		product.setProductId(object_data.product_id)
		product.setProductName(object_data.product_name)
		//print "${product.getProductName()} ${product.getPrice()} ${product.getGreenScore()}"
		print "${product.getProductBrandName()}, ${product.getPrice()}, ${product.getGreenScore()}"
		print "${GreenScoreUtil.getBrandNameGreenScore(product.getProductBrandName())}"
		return product
	}
	
	def generate_product_list(productIds)
	{	
		print productIds
		def product_array = []
		productIds = productIds.split(",");
		for ( productId in productIds ) 
		{	
			print productId
			//create the URL
			def url = base + productId + '?idType=' + idType + '&key=' + apiKey
			product_array.add(product_factory(url))
		}
		return get_json_purchase_summary(product_array)
	}
	def get_json_purchase_summary(product_array)
	{
		def purchase_summary = [:]
		def items = []
		for (purchase in product_array)
		{
			def product_summary = [:]
			product_summary["product_name"] = purchase.getProductName()
			product_summary["product_brand"] = purchase.getProductBrandName()
			product_summary["product_price"] = purchase.getPrice()
			product_summary["product_greenscore"] = purchase.getGreenScore()
			items.add(product_summary)
		}
		purchase_summary["total_greenscore"] = new Purchase(product_array).getGreenScore()
		purchase_summary["items"] = items
		return purchase_summary	
	}
	
	def get_flower_count() {
		User user = new User();		
		user.setGreenScore(15);
		return user.getGreenScore();
	}
}
