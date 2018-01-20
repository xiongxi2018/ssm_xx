package com.xx.tmall.service;

import com.xx.tmall.pojo.Product;
import com.xx.tmall.pojo.Property;
import com.xx.tmall.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueService {
    void init(Product p);
    List<PropertyValue> list(int pid);
    PropertyValue get(int ptid,int pid);
    void update(PropertyValue pv);
}
