// Source code is decompiled from a .class file using FernFlower decompiler.
package com.babystep.controller;

import com.babystep.model.DiaryPopupDAO;
import com.babystep.model.DiaryPopupDTO;
import com.babystep.model.TodoDAO;
import com.babystep.model.TodoDTO;
import java.sql.Date;
import java.util.List;

public class TodoService {
   private TodoDAO todoDAO = new TodoDAO();
   private DiaryPopupDAO diarypopupDAO = new DiaryPopupDAO();

   public TodoService() {
   }

   public List<TodoDTO> getTodoListByDate(String userId, String selectedDate) {
      return this.todoDAO.getTodoListByDate(userId, selectedDate);
   }

   public void addTodoListByDate(String todoContent, Date todoDate, String userId) {
      TodoDTO todo = new TodoDTO(todoContent, todoDate, userId, todoDate);
      todo.setTodoContent(todoContent);
      todo.setTodoDate(todoDate);
      todo.setUserId(userId);
      this.todoDAO.addTodoListByDate(todo);
   }

   public List<DiaryPopupDTO> detaildiary(String USER_ID, String selectedDate) {
      return this.diarypopupDAO.detaildiary(USER_ID, selectedDate);
   }
}
