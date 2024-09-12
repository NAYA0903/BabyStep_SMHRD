package com.babystep.model;

public class CountryDTO {

   private int c_num ; 
   private String c_title ;
   private String c_writer ;
   private String c_filename ;
   private String c_content ;
   private String c_bdate ;
   private int c_snum ;
   
   public CountryDTO(int c_num, String c_title, String c_writer, String c_filename, String c_content, String c_bdate,
         int c_snum) {
   
      this.c_num = c_num;
      this.c_title = c_title;
      this.c_writer = c_writer;
      this.c_filename = c_filename;
      this.c_content = c_content;
      this.c_bdate = c_bdate;
      this.c_snum = c_snum;
   }

   public int getC_num() {
      return c_num;
   }

   public String getC_title() {
      return c_title;
   }

   public String getC_writer() {
      return c_writer;
   }

   public String getC_filename() {
      return c_filename;
   }

   public String getC_content() {
      return c_content;
   }

   public String getC_bdate() {
      return c_bdate;
   }

   public int getC_snum() {
      return c_snum;
   }

   
}