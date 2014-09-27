package gamify_greens;

import java.util.Date;

public class TargetPoints implements Rewards {

	int pointValue = 0;
	
	public TargetPoints() { }
	
	public void TargetPointsS(int pointValue)
	{
		this.pointValue = pointValue;
	}
	
	public Date getExpiration()
	{
		return null;
	}
}
