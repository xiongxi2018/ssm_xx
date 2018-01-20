package com.xx.tmall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xx.tmall.page.Page;
import com.xx.tmall.pojo.Category;
import com.xx.tmall.pojo.Product;
import com.xx.tmall.pojo.ProductImage;
import com.xx.tmall.service.CategoryService;
import com.xx.tmall.service.ProductImageService;
import com.xx.tmall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductImageService productImageService;
    @RequestMapping("admin_product_list")
    public String list(Model model,Page page,int cid){
        Category c = categoryService.get(cid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> ps = productService.list(cid);
        int total = (int)new PageInfo<>(ps).getTotal();
        page.setTotal(total);
        page.setParam("&cid="+c.getId());
        model.addAttribute("c",c);
        model.addAttribute("ps",ps);
        model.addAttribute("page",page);
        return "admin/listProduct";
    }

    @RequestMapping("admin_product_add")
    public String add(Product product){
        productService.add(product);
        return "redirect:/admin_product_list?cid="+product.getCid();
    }

    @RequestMapping("admin_product_delete")
    public String delete(int id){
        Product product = productService.get(id);
        productService.delete(id);
        return "redirect:/admin_product_list?cid="+product.getCid();
    }

    @RequestMapping("admin_product_edit")
    public String edit(int id,Model model){
       Product product = productService.get(id);
       Category category = categoryService.get(product.getCid());
       product.setCategory(category);
       model.addAttribute("p",product);
       return "admin/editProduct";
    }

    @RequestMapping("admin_product_update")
    public String update(Product product){
        productService.update(product);
        return "redirect:/admin_product_list?cid="+product.getCid();
    }
}
