package com.babystep.model;

import java.util.Date;

public class HolidayDTO {
    private Date holiday_date;
    private String holiday_name;

    public HolidayDTO(Date holidayDate, String holidayName) {
        this.holiday_date = holidayDate;
        this.holiday_name = holidayName;
    }

    public Date getHolidayDate() {
        return holiday_date;
    }

    public void setHolidayDate(Date holidayDate) {
        this.holiday_date = holidayDate;
    }

    public String getHolidayName() {
        return holiday_name;
    }

    public void setHolidayName(String holidayName) {
        this.holiday_name = holidayName;
    }
}
