package com.util;

import java.text.DecimalFormat;

public class Retainone {
	public String getAdecimal (String str) {
		//DecimalFormat df = new DecimalFormat("#.0");
		//String newstr = df.format(Double.parseDouble(str));
		String newstr = String.format("%.1f", Double.parseDouble(str));
		return newstr;
		
	}

}
