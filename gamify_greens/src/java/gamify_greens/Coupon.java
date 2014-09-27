package gamify_greens;

import java.util.Date;

public class Coupon implements Rewards {

	Date expiration;
	String productId;
	
	public Coupon() { }

	public Coupon(Date expiration, String productId)
	{
		this.expiration = expiration;
		this.productId = productId;
	}
	
	public Date getExpiration()
	{
		return expiration;
	}
}
