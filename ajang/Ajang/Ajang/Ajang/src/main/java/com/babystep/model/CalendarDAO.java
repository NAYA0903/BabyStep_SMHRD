package com.babystep.model;

import java.util.Calendar;

public class CalendarDAO {

	// 윤년인지 확인하는 메서드
    public static boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }

    // 년, 월을 넘겨받아 그 달의 마지막 날짜를 리턴하는 메서드
    public static int lastDay(int year, int month) {
        int[] m = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if (month == 2 && isLeapYear(year)) {
            return 29;  // 윤년일 때 2월의 마지막 날은 29일
        }
        return m[month - 1];  // 해당 월의 마지막 날짜 리턴
    }

    // 년, 월, 일을 넘겨받아 1년 1월 1일부터 지나온 날짜의 합계를 리턴하는 메서드
    public static int totalDay(int year, int month, int day) {
        int sum = 0;

        // 1년 1월 1일부터 해당 연도 전까지의 모든 날 계산
        for (int i = 1; i < year; i++) {
            sum += isLeapYear(i) ? 366 : 365;  // 윤년일 경우 366일, 평년은 365일
        }

        // 해당 연도의 1월부터 전달까지의 날 계산
        for (int i = 1; i < month; i++) {
            sum += lastDay(year, i);
        }

        // 해당 달의 날 계산
        return sum + day - 1;  // 1월 1일을 0일로 계산하므로 -1
    }

    // 요일을 숫자로 리턴하는 메서드 (일요일=0, 월요일=1, ..., 토요일=6)
    public static int weekDay(int year, int month, int day) {
        return (totalDay(year, month, day) + 1) % 7;  // 1월 1일이 월요일이므로 +1
    }
    
    // 1일의 요일을 구하는 메서드
    public int getWeekDay(int year, int month, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, day);
        return calendar.get(Calendar.DAY_OF_WEEK) - 1; // 일요일부터 시작하므로 -1
    }

    // 해당 월의 마지막 날을 구하는 메서드
    public int getLastDay(int year, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, 1);
        return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    }

    // 현재 날짜 정보를 반환하는 메서드
    public CalendarDTO getToday() {
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1;
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        return new CalendarDTO(year, month, day);
    }
	
}
