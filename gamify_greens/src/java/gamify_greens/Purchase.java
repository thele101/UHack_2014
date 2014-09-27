package gamify_greens;

import java.util.Collection;

public class Purchase {

	private Collection<Product> products;

	public Purchase() {	}
	
	public Purchase(Collection<Product> products)
	{
		this.products = products;
	}
	
	public void shareFacebook()
	{
		//Do Something
	}
	
	public void shareTwitter()
	{
		//Do Something
	}
	
	public float getGreenScore()
	{
		if (products.isEmpty())
		{
			return 0;
		}
		else 
		{
			float total = 0;
			
			for(Product prod: products)
			{
				total += prod.getGreenScore();
			}
			return total;
		}
	}
}

