package gamify_greens;

public class User {
	
	private int greenScore = 0;
	private int decayScore = 0;
	private int level = 1;
	private RewardTracker tracker;
	
	public RewardTracker getTracker() 
	{
		return tracker;
	}

	public void setTracker(RewardTracker tracker) 
	{
		this.tracker = tracker;
	}

	public int getGreenScore() 
	{
		return greenScore;
	}
	
	public void setGreenScore(int greenScore) 
	{
		this.greenScore = greenScore;
		setLevel();
	}
	
	public int getDecayScore() 
	{
		return decayScore;
	}
	
	public void setDecayScore(int decayScore)
	{
		this.decayScore = decayScore;
		setLevel();
	}

	private void setLevel()
	{
		level = greenScore - decayScore;
	}
	
	public int getLevel()
	{
		return level;
	}
	
}
