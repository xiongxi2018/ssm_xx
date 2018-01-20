package com.xx.tmall.service.impl;

import com.xx.tmall.mapper.ProductMapper;
import com.xx.tmall.pojo.Category;
import com.xx.tmall.pojo.Product;
import com.xx.tmall.pojo.ProductExample;
import com.xx.tmall.pojo.ProductImage;
import com.xx.tmall.service.CategoryService;
import com.xx.tmall.service.ProductImageService;
import com.xx.tmall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    ProductMapper productMapper;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductImageService productImageService;
    @Override
    public List<Product> list(int cid) {
        ProductExample example = new ProductExample();
        example.createCriteria().andCidEqualTo(cid);
        example.setOrderByClause("id desc");
        List result = productMapper.selectByExample(example);
        setCategory(result);
        setFirstProductImage(result);
        return result;
    }

    @Override
    public void setFirstProductImage(Product product) {
        List<ProductImage> pis = productImageService.list(product.getId(),productImageService.type_single);
        if(!pis.isEmpty()){
            ProductImage productImage = pis.get(0);
            product.setFirstproductImage(productImage);
        }
    }

    public void setFirstProductImage(List<Product> ps){
        for (Product p : ps){
            setFirstProductImage(p);
        }
    }

    @Override
    public void add(Product product) {
        productMapper.insert(product);
    }

    @Override
    public void delete(int id) {
        productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Product get(int id) {
        Product p = productMapper.selectByPrimaryKey(id);
        setFirstProductImage(p);
        setCategory(p);
        return p;
    }

    public void setCategory(List<Product> ps){
        for (Product p : ps)
            setCategory(p);
    }
    public void setCategory(Product p){
        int cid = p.getCid();
        Category c = categoryService.get(cid);
        p.setCategory(c);
    }
    @Override
    public void update(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }
}
