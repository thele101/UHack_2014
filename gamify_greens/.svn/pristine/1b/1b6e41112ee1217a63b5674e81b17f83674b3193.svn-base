package gamify_greens;

import java.util.Calendar;
import java.util.Collection;

public class RewardTracker {
	Collection<Rewards> rewards;
	String ProductId;
	
	public void creditRewards(int level){
		if ((level % 10) == 0){
			plantTree();
		}
		else if ((level % 2) == 0){
			Calendar cal = Calendar.getInstance(); 
			cal.add(Calendar.MONTH, 1);
			rewards.add(new Coupon(cal.getTime(), ProductId));
		}
		else {
			rewards.add(new TargetPoints());
		}
	}

	private void plantTree() {
		// TODO Auto-generated method stub
		
	}
	Collection<Rewards> getRewards(){
		return rewards;
	}
}
