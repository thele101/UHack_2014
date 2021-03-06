package gamify_greens;

import static gamify_greens.GreenScoreUtil.getBrandNameGreenScore;
import static gamify_greens.GreenScoreUtil.getPricingGreenScore;

public class Product {

	private String productId;
    private String productName;
    private String productBrandName;
    private String productDescription;
    private float price;
   
	public Product() { }
   	
	public Product(	String productId, 
					String productName, 
					String productBrandName, 
					String productDescription, 
					float price) 
	{
		this.productId = productId;
		this.productName = productName;
		this.productName = productBrandName;
		this.productDescription = productDescription;
		this.price = price;
	}
	
	public String getProductId()
	{
		return productId;
	}
	
	public void setProductId(String productId)
	{
		this.productId = productId;
	}
	
	public String getProductName()
	{
		return productName;
	}

	public void setProductName(String productName)
	{
		this.productName = productName;
	}
	  
	public String getProductBrandName()
	{
		return productBrandName;
	}

	public void setProductBrandName(String productBrandName)
	{
		this.productBrandName = productBrandName;
	}
	 
	public String getProductDescription()
	{
		return productDescription;
	}
	
	public void setProductDescription(String productDescription)
	{
		this.productDescription = productDescription;
	}
	  
	public float getPrice()
	{
		return price;
    }
	
    public void setPrice(float price)
    {
        this.price = price;
    }
	
	public float getGreenScore()
	{
		/*
		float value = 	getBrandNameGreenScore(productBrandName) * 
						getPricingGreenScore(price) *
						getUHackWildcard();
						*/
		float value = 	getBrandNameGreenScore(productBrandName) * 
				getPricingGreenScore(price);
		return value;
	}
	
	
    @Override
    public String toString()
    {
        return 	"productName = " + productName +
				", productBrandName = " + productBrandName + 
				", price = " + price + 
				", productDescription = " + productDescription + 
				", productId = " + productId;
    }
}
