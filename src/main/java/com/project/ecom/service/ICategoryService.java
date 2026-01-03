package com.project.ecom.service;

import com.project.ecom.entity.Category;
import com.project.ecom.exception.CategoryNotFoundException;

import java.util.List;

public interface ICategoryService {
    List<Category> listByPage(CategoryPageInfo pageInfo, int pageNum);

    public List<Category> listCategoriesUserInForm();
    public Category saveCategory(Category category);

    public void deleteCategory(int id) throws CategoryNotFoundException;

    public Category getCategory(Integer id) throws CategoryNotFoundException;
    public Category getCategoryByAlias(String alias) throws CategoryNotFoundException;

    //list up parent of categories
    List<Category> getCategoryParents(Category child);


    String checkCategoryTitle(Integer id, String title, String alias);
}
