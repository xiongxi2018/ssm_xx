package com.xx.tmall.service;

import com.xx.tmall.pojo.Product;
import com.xx.tmall.pojo.ProductImage;

import java.util.List;

public interface ProductService {
    List<Product> list(int cid);
    void add(Product product);
    void delete(int id);
    Product get(int id);
    void update(Product product);
    void setFirstProductImage(Product product);
}
