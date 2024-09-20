package com.babystep.model;

public class SearchCriteria {
    private String field;
    private String searchText;

    public SearchCriteria(String field, String searchText) {
        this.field = field;
        this.searchText = searchText;
    }

    public String getField() {
        return field;
    }

    public String getSearchText() {
        return searchText;
    }
}
