package gamify_greens;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public final class GreenScoreUtil {

    private static final Map<String, Float> brandMap;
    static
    {
        brandMap = new HashMap<String, Float>();
        brandMap.put("LG", 1.2f);
        brandMap.put("Apple", 1.3f);
        brandMap.put("Method", 1.5f);
        brandMap.put("General Electric", 1.5f);
    }

    // private constructor to prevent instantiation of the class
    private GreenScoreUtil() { }

    public static float getBrandNameGreenScore(String productBrandName) 
    {
		Float value = brandMap.get(productBrandName);
		
		if (value != null) 
		{
			return value;
		} 
		else 
		{
			// No such key
			return 1;
		}
    }
	
	public static float getPricingGreenScore(float price) {
		return price * .10f;
    }
	
	public static float getUHackWildcard() {
		float minWildcard = 1.0f;
		float maxWildcard = 2.0f;

		// random should probably be a field
		Random random = new Random();

		return random.nextFloat() * (maxWildcard - minWildcard) + minWildcard;
    }
}
