package com.sonht.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

public class Test {

	public static void main(String[] args) {
		String startDate = "";  // Example start date
        String endDate = "    ";    // Example end date
        
        List<String> mess = validateTripDates(startDate, endDate);

        mess.forEach(m -> System.out.println(m));

	}
	private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    
    public static List<String> validateTripDates(String startDateStr, String endDateStr) {
    	List<String> results = new ArrayList<String>();
    	if ((startDateStr == null || startDateStr.trim().isEmpty()) && (endDateStr == null || endDateStr.trim().isEmpty())) {
    		results.add("Start date cannot be empty.");
    		results.add("End date cannot be empty.");
    		return results;
    	}
        if (startDateStr == null || startDateStr.trim().isEmpty()) {
        	results.add("Start date cannot be empty.");
            return results;
        }

        if (endDateStr == null || endDateStr.trim().isEmpty()) {
        	results.add("End date cannot be empty.");
            return results;
        }

        LocalDate startDate;
        LocalDate endDate;
        LocalDate currentDate = LocalDate.now();

        try {
            startDate = LocalDate.parse(startDateStr, DATE_FORMATTER);
        } catch (DateTimeParseException e) {
        	results.add("Invalid start date format. Please use yyyy-MM-dd.");
            return results;
        }

        try {
            endDate = LocalDate.parse(endDateStr, DATE_FORMATTER);
        } catch (DateTimeParseException e) {
        	results.add("Invalid end date format. Please use yyyy-MM-dd.");
            return results;
        }

        if (startDate.isBefore(currentDate)) {
        	results.add("Start date must be after the current date.");
            return results;
        }

        if (endDate.isBefore(startDate) || endDate.equals(startDate)) {
        	results.add("End date must be after the start date.");
            return results;
        }

        return results;
    }
}
